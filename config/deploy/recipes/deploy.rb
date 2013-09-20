namespace :deploy do
  desc "Symlinks application configuration from shared folder"
  task :symlink_config, roles: [:app, :worker, :runner], except: {no_release: true} do
    commands = config_files.map do |file|
      "rm -rf #{release_path}/config/#{file} && ln -s #{shared_path}/config/#{file} #{release_path}/config/#{file}"
    end
    run "cd #{release_path} && #{commands.join(" && ")}"
  end

  task :app_config do
    ensure_directory("#{shared_path}/config", mode: 775, owner: user, group: user)
    config_files.each do |file|
      transfer(:up, "config/#{file}", "#{shared_path}/config/#{file}")
    end
  end
end
