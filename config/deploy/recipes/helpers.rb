require 'active_support/all'
require 'erubis'

module Capistrano::Configuration::Namespaces
  def dependency(name, opts = {}, &block)
    opts.merge!(once: true, on_no_matching_servers: :continue)
    task(name, opts, &block)
  end
end

def bash_run(command, opts = {})
  run command, opts.merge(shell: :bash)
end

def sudo_run(command, opts = {})
  sudo_opts = opts.slice(:as)
  bash_run "#{sudo(sudo_opts)} #{command}", opts
end

def apt_install(*packages)
  sudo_run "DEBIAN_FRONTEND=noninteractive apt-get install -y -qq #{packages.join(' ')} #{mute}"
end

def apt_update
  sudo_run "apt-get -qq update #{mute}"
end

def apt_build_dep(*packages)
  sudo_run "apt-get build-dep -y -qq #{packages.join(' ')} #{mute}"
end

def apt_repository(repository)
  sudo_run "add-apt-repository -y #{repository} #{mute}"
end

def template(target_path, opts = {})
  source_path = File.expand_path(File.join("../../templates", opts.fetch(:source, target_path[1..-1])), __FILE__)
  content = Erubis::Eruby.new(File.read(source_path)).result(opts[:locals])

  if opts.fetch(:sudo, false)
    tmp_path = "/tmp/#{SecureRandom.hex}"
    put(content, tmp_path)
    sudo_run("mv -f #{tmp_path} #{target_path}")
  else
    put(content, target_path)
  end

  ensure_permissions(target_path, opts)
end

def mute
  mute_command if mute_output
end

def ensure_permissions(path, opts = {})
  sudo_opts = opts.slice(:as)
  recursive = opts.fetch(:recursive, false) ? "-R" : ""
  sudo_run("chown #{opts[:owner]} #{recursive} #{path}", sudo_opts) if opts.fetch(:owner, false)
  sudo_run("chgrp #{opts[:group]} #{recursive} #{path}", sudo_opts) if opts.fetch(:group, false)
  sudo_run("chmod #{opts[:mode]} #{recursive} #{path}", sudo_opts) if opts.fetch(:mode, false)
end

def ensure_directory(path, opts = {})
  bash_run "[[ -d #{path} ]] && exit || #{sudo} mkdir -p #{path}"
  ensure_permissions(path, opts)
end

def pending_notifications
  @pending_notifications ||= {}
end

def notify(service)
  pending_notifications[service] ||= {}
  pending_notifications[service] = current_task.options.slice(:roles, :only, :except)
end

on(:finish) { pending_notifications.each { |service, options| sudo_run "service #{service} restart || service #{service} start", options } }

