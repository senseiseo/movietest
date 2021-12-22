source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.3'

gem 'rails', '~> 6.1.4', '>= 6.1.4.1'
gem 'puma', '~> 5.0'
gem 'jbuilder', '~> 2.7'
gem 'bcrypt', '~> 3.1.7'
gem 'pg'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'pagy', '~> 5.5'
gem 'bcrypt', '~> 3.1.7'
gem 'draper', '~> 4.0'
gem 'valid_email2', '~> 4.0'
gem 'webpacker', '6.0.0.rc.6'
gem 'pundit', '~> 2.1'

group :development, :test do
  gem 'rspec-rails', '~> 5.0.0'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'pry'
  gem 'faker' , '~> 2'
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  gem 'spring'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
