_cset :branch, "master"
set :rails_env, "production"
set :deploy_to, "/var/www/craftery.camaloon.com"

server "craftery.camaloon.com", :app, :web, :db, primary: true
