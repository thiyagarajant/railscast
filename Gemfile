source 'http://rubygems.org'

gem 'rails', '3.2.8'
gem 'mysql2'
gem 'jquery-rails'
gem 'bcrypt-ruby', '~> 3.0.0'
gem 'simple_form'
gem 'whenever', :require => false
gem 'wash_out'
gem 'geokit'
#gem 'bootstrap-will_paginate'
#gem 'client_side_validations'
#gem 'client_side_validations-simple_form'
gem "paperclip", "~> 3.3.1"
gem 'omniauth-facebook'
gem 'omniauth-google'
gem 'kaminari'
# gem 'will_paginate', '~> 3.0'
gem 'activemerchant', :require => 'active_merchant'
#gem 'paypal-recurring'
gem 'stripe'
gem 'twitter-bootstrap-rails', :git => 'https://github.com/seyhunak/twitter-bootstrap-rails.git'

group :assets do
  gem 'less-rails'
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'therubyracer', '~> 0.10.2',  :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'
end

group :development do
  gem 'thin'                                                              # server
  gem 'annotate', :git => 'https://github.com/ctran/annotate_models.git'  #getting schema information
  gem 'capistrano-deploy', :require => false
  gem "parallel_tests"
	gem 'populator'
end

  group :development, :test do
    gem 'factory_girl_rails'
    gem 'database_cleaner'
    gem 'cucumber-rails', :require => false
    gem "rspec-rails", "~> 2.0"
    gem 'ffaker'
    gem 'capybara'
    gem 'rails_best_practices'
  end

group :test do
  #gem 'simplecov',  :require => false
  #gem "shoulda-matchers"
  #gem "em-spec", "~> 0.2.6"
end

group :production do
  gem 'unicorn', '>=3.2.1', :require => false
  gem 'pg'
  gem 'heroku'
end
