source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'rails', '~> 5.2.0'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jbuilder', '~> 2.5'
gem 'bcrypt', '~> 3.1.7'
gem 'aws-sdk', '~> 3'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'redcarpet', '>= 3.4.0'
gem 'jquery-rails', '>= 4.3.3'
gem 'sprockets-rails', :require => 'sprockets/railtie'
gem 'bootstrap', '~> 4.1.1'
gem 'faker', '>= 1.8.7'
gem 'will_paginate', '>= 3.1.6'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
  gem 'rails-controller-testing'
  gem 'minitest', '>= 5.8.4'
  gem 'minitest-reporters', '>= 1.3.0'
end

### TODO: Complete the basic applicaiton setup in the gemfile

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
