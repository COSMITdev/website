source 'https://rubygems.org'

ruby '2.2.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.15'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
# General stuff
gem 'initjs', '~> 2.1.2'
gem 'rails-i18n', '~> 4.0.4'
gem 'slim-rails', '~> 3.0.1'
gem 'devise', '~> 3.5.2'
gem 'devise-i18n', '~> 0.12.1'
gem 'activeadmin', github: 'activeadmin'
gem 'simple_form', '~> 3.1.0'
gem 'pundit', '~> 1.0.1'
gem 'autoprefixer-rails', '~> 5.2.1'
gem 'bootstrap-sass', '~> 3.3.5'
gem 'font-awesome-rails', '~> 4.4.0'
gem 'draper', '~> 1.3'
gem 'nprogress-rails', '~> 0.1.6'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# Use Unicorn as the app server
# gem 'unicorn'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
# Masks for monetary fields
gem 'maskmoney-rails'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'pry-rails'
end

group :development do
  gem 'rack-mini-profiler'
  gem 'letter_opener'
end

group :development, :test do
  gem 'factory_girl_rails', '~> 4.5.0'
  gem 'rspec-rails', '~> 3.3.3'
  gem 'awesome_print', '~> 1.6.1', require: false
  gem 'spring-commands-rspec', '~> 1.0.4'
  gem 'thin', '~> 1.6.3'
  gem 'dotenv-rails', '~> 2.0.2'
end

group :test do
  gem 'simplecov', '~> 0.10.0', require: false
  gem 'database_cleaner', '~> 1.4.1'
  gem 'shoulda-matchers', '~> 2.8.0', require: false
  gem 'capybara'
  gem 'selenium-webdriver'
end

group :production do
  gem 'rails_12factor', '~> 0.0.3'
  gem 'passenger', '~> 5.0'
end
