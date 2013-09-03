Dir["#{Rails.root}/lib/core_ext/**/*.rb"].each { |x| require x }
Dir["#{Rails.root}/lib/ext/**/*.rb"].each { |x| require x }
