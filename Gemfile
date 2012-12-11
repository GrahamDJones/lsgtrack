source 'https://rubygems.org'

gem 'rails', '3.2.9'

gem 'pg'
gem 'kaminari'
gem 'devise'
gem 'devise-async'
gem 'cancan', "~> 1.6.8"
gem 'paperclip', "~> 3.3.1"
gem 'searcher', "~> 0.0.6"
gem 'jquery-rails'
gem 'delayed_job'
gem 'delayed_job_active_record'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'dynamic_form', "~> 1.1.4"
  gem 'uglifier', '>= 1.0.3'
end

group :test do
  gem 'cucumber-rails', :require => false
  gem 'capybara', "~> 1.1.3"
  gem 'database_cleaner'
  gem 'factory_girl'
  gem 'email_spec', "~> 1.2.1"
end

group :development do
  gem 'capistrano'
  gem 'rvm-capistrano'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :test, :development do
  gem 'rspec-rails', "~> 2.4"
  gem 'gmail'
end

group :production do
  gem 'therubyracer', :platforms => :ruby
end