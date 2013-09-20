_cset :mute_output, false
_cset :mute_command, "> /dev/null 2>&1"

namespace :provision do
  namespace :prepare do
    dependency :setup do
      set :deploy_user, user
      set :deploy_port, port

      set :user, ENV.fetch("USERNAME", 'vagrant')
      set :port, ENV.fetch("PORT", 22)
      set :password, ENV.fetch("PASSWORD", '')
      ssh_options[:keys] ||= []
      ssh_options[:keys] << '~/.vagrant.d/insecure_private_key'
    end

    desc "Prepare servers with basic configurations in order to be provisionable"
    dependency :default do
      setup
      setup_sources
      apt_update
      sudo_run "apt-get upgrade -y -ss #{mute}"
      apt_install "curl", "ufw"
      setup_locales
      setup_timezone
      setup_deploy_user
      setup_authorized_keys
      setup_rvm
      secure_network
      sudo_run "apt-get clean #{mute}"
    end

    dependency :setup_sources do
      release = capture("lsb_release -cs", shell: :bash).strip
      template "/etc/apt/sources.list", locals: {release: release}, owner: "root", group: "root", mode: 644, sudo: true
    end

    dependency :setup_deploy_user do
      _cset(:deploy_user, user)
      bash_run "getent passwd #{deploy_user} #{mute} || #{sudo} useradd -m -s /bin/bash #{deploy_user}"
      sudo_run "getent group admin || groupadd -r admin"
      sudo_run "usermod -a -G admin #{deploy_user}"
      sudo_run "usermod -a -G www-data #{deploy_user}"
      sudo_run "sed -i -e '/Defaults\s\+env_reset/a Defaults\texempt_group=admin' /etc/sudoers"
      sudo_run "sed -i -e 's/%admin ALL=(ALL) ALL/%admin ALL=NOPASSWD:ALL/g' /etc/sudoers"
      ensure_directory "/var/www", mode: 775, owner: "www-data", group: "www-data"
    end

    dependency :setup_timezone do
      sudo_run "bash -c 'echo '#{timezone}' > /etc/timezone'"
      sudo_run "dpkg-reconfigure -f noninteractive tzdata #{mute}"
    end

    dependency :setup_locales do
      template "/var/lib/locales/supported.d/local", sudo: true
      sudo_run "dpkg-reconfigure -f noninteractive locales #{mute}"
    end

    dependency :setup_authorized_keys do
      ensure_directory("/home/#{deploy_user}/.ssh", mode: 700)
      authorized_github_users.each do |user|
        sudo_run "bash -c 'curl -ss -w \"\\n\" https://github.com/#{user}.keys >> /home/#{deploy_user}/.ssh/authorized_keys'"
      end
      ensure_permissions("/home/#{deploy_user}/.ssh", owner: deploy_user, group: deploy_user, recursive: true)
      ensure_permissions("/home/#{deploy_user}/.ssh/authorized_keys", mode: 644)
    end

    dependency :setup_rvm do
      bash_run "test -d /usr/local/rvm || (curl -ss -L https://get.rvm.io | #{sudo} bash -s stable #{mute})"
      bash_run "source /etc/profile.d/rvm.sh"
      sudo_run "adduser #{deploy_user} rvm"
    end

    dependency :secure_network do
      # ssh config
      sudo_run "sed -i 's/Port 22/Port #{deploy_port}/g' /etc/ssh/sshd_config"
      sudo_run "sed -i 's/PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config"
      sudo_run "sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config"
      sudo_run "sed -i '/TCPKeepAlive yes/a ClientAliveInterval 15\nClientAliveCountMax 5' /etc/ssh/sshd_config"

      notify "ssh"

      # ufw config
      sudo_run "ufw --force reset #{mute}"
      sudo_run "ufw allow #{deploy_port}/tcp #{mute}"
      sudo_run "ufw default deny incoming #{mute}"
      sudo_run "ufw default allow outgoing #{mute}"
      sudo_run "ufw --force enable #{mute}"
    end
  end

  desc "Provision servers with all required app dependencies"
  dependency :default do
    essential
    memcached
    nodejs
    nginx
    postgresl_server
    #imagemagick
  end

  dependency :essential do
    apt_install "autoconf", "automake", "bison", "build-essential", "daemon", "git-core", "jpegoptim", "libc6-dev",
                "libcurl4-openssl-dev", "libffi-dev", "libgdbm-dev", "libreadline6",
                "libreadline6-dev", "libsqlite3-dev", "libssl-dev", "libtool", "libxml2", "libxml2-dev", "libxslt-dev",
                "libxslt1-dev", "libyaml-dev", "ncurses-dev", "openssl", "pkg-config", "pngquant", "python-pip",
                "python-software-properties", "s3cmd", "sqlite3", "subversion", "tar", "zlib1g", "zlib1g-dev", "vim", "unzip"
  end

  dependency :nodejs do
    apt_repository "ppa:chris-lea/node.js"
    apt_update
    apt_install "nodejs"
    bash_run "which npm || (curl -ss http://npmjs.org/install.sh | sh)"
  end

  dependency :redis, roles: :db, only: {primary: true} do
    apt_install "redis-server"
    notify "redis-server"
  end

  dependency :memcached, roles: :db, only: {primary: true} do
    apt_install "memcached"
    notify "memcached"
  end

  dependency :postgresl_server, roles: :db, only: {primary: true} do
    # TODO
  end

  dependency :nginx, roles: :web do
    # TODO

    sudo_run "ufw allow 80/tcp #{mute}"
    sudo_run "ufw allow 443/tcp #{mute}"

    notify "nginx"
  end

  dependency :imagemagick do
    apt_build_dep("imagemagick")
    bash_run "(cd /tmp && wget --quiet http://ftp.vim.org/ImageMagick/ImageMagick-#{imagemagick_version}.tar.gz && tar xfz ImageMagick-#{imagemagick_version}.tar.gz && cd ImageMagick-#{imagemagick_version} && ./configure --prefix=/usr #{mute} && #{sudo} make install #{mute})"
  end

  def dpkg_install(name, url, basename = nil)
    basename ||= File.basename(url)
    "dpkg -L #{name} #{mute_command} || (wget --quiet -N #{url}; DEBIAN_FRONTEND=noninteractive #{sudo} dpkg -i #{basename}; rm #{basename})"
  end

  dependency :setup_swap do
    swapfile = '/swapfile'
    bash_run "(#{sudo} grep 'swap' /etc/fstab) || (test -e #{swapfile} || (#{sudo} dd if=/dev/zero of=#{swapfile} bs=1024 count=512k && #{sudo} mkswap #{swapfile} && #{sudo} swapon #{swapfile} && (#{sudo} bash -c \"echo -e '#{swapfile}\tnone\tswap\tsw\t0\t0' >> /etc/fstab\") && #{sudo} chmod 644 #{swapfile} && #{sudo} chown root:root #{swapfile}))"
  end
end

