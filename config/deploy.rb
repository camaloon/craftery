# RVM
set :rvm_ruby_string, "jruby"
set :rvm_type, :system
set :rvm_install_with_sudo, true

# Configuration
set :application, "craftery"
set :keep_releases, 4
set :bundle_without, [:development, :test]

# Stages
set :default_stage, "production"

# SCM
set :scm, :git
set :deploy_via, :remote_cache
set :repository, "git@github.com:camaloon/craftery.git"

# Users
set :use_sudo, false
_cset :user, "deployer"

# Sidekiq/Clockwork
set :sidekiq_role, :worker

# Misc
set :port, 8622
set :config_files, ['credentials.yml']
default_run_options[:pty] = true
ssh_options[:forward_agent] = true

# Provisioning
set :app_config, lambda { YAML.load_file("config/app.yml")[stage.to_s] }

set :authorized_github_users, %w(rogercampos knoopx nandinga)
set :timezone, 'Europe/Madrid'

after "deploy:restart", "deploy:cleanup"
after "deploy:update_code", 'deploy:symlink_config'

