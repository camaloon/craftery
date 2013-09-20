load 'deploy' if respond_to?(:namespace) # cap2 differentiator
load 'config/deploy'

set :assets_role, [:web, :worker]
load 'deploy/assets'

Dir['vendor/gems/*/recipes/*.rb', 'vendor/plugins/*/recipes/*.rb', 'config/deploy/recipes/*.rb'].sort_by {|x|
  File.basename(x, ".rb") == "helpers" ? 0 : 1
}.each { |plugin| load(plugin) }

require 'capistrano/ext/multistage'
require 'rvm/capistrano'
require 'bundler/capistrano'
require 'puma/capistrano'

