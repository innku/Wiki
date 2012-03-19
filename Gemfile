source 'http://rubygems.org'

gem 'rails', '3.0.3'

gem 'devise' 
gem 'acts-as-taggable-on'
gem 'RedCloth'
gem 'cancan'
gem "friendly_id", "~> 3.1"
gem "coderay"
gem 'sqlite3'
gem 'hoe', '~> 1.5.1' # Heroku's rubygems is too old for hoe 2.9.1 as of 28 Mar 2011

group :development, :test do
  gem 'rspec-rails' # Needs to be in development because of generators.
  gem 'rake', '0.8.7'
end

group :development do
  gem "livereload"
  gem "rb-inotify"
end

group :test do
  gem 'cucumber-rails'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
end
