source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.4'

# Use ActiveModel has_secure_password
#gem 'bcrypt', '~> 3.1.7', :require => 'bcrypt'


# Use sqlite3 as the database for Active Record
#gem 'sqlite3'

# Use postgresql as the database for Active Record
group :development do
  gem 'pg'
end

group :production, :staging do
  gem 'pg'
  gem 'rails_12factor'
end

gem 'pygments.rb'
gem 'redcarpet'
gem 'quiet_assets'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.5'


# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

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

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

ruby "2.1.1"