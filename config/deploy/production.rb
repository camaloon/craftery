set :branch, "master"
set :deploy_to, "/var/www/rails/craftery.camaloon.com"
set :rails_env, "production"

server "yronwood.camaloon.com", user: "deployer", roles: %w(app web db), primary: true
