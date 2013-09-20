source 'https://rubygems.org'

ruby '1.9.3', :engine => 'jruby', :engine_version => '1.7.4'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

gem 'activerecord-jdbcpostgresql-adapter'
gem 'puma'

gem 'inherited_resources'
gem 'kaminari'
gem 'simple_form', '3.0.0.rc'
gem 'slim-rails'
gem 'anjlab-bootstrap-rails', require: 'bootstrap-rails', github: 'anjlab/bootstrap-rails'
gem 'hashie'

gem 'puma'
gem 'activerecord-jdbcpostgresql-adapter'

group :development do
  gem 'annotate', '>=2.5.0'
  gem 'quiet_assets'
  gem 'lipsum'
  gem 'capistrano'
  gem 'capistrano-ext'
  gem 'rvm-capistrano'
end

group :test do
  gem 'capybara'
  gem 'rspec-rails', '~> 2.0'
  gem 'turnip', :git => 'git://github.com/runtastic/turnip.git' # using this fork because of: https://github.com/jnicklas/turnip/issues/100
  gem 'factory_girl_rails'
  gem 'shoulda-matchers'
  gem 'database_cleaner'
  gem 'timecop'
  gem 'fuubar'
end

group :development, :test do
  gem 'pry-rails'
end
