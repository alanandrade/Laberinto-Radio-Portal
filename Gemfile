source 'http://rubygems.org'

gem 'rails', '3.1.3'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'
group :production do 
  # mysql gem didn't support the utf8 encoding.
  # gem 'mysql'
  gem "mysql2", '~> 0.3.11'
  # gem 'pg'
end

gem 'execjs'
gem 'therubyracer'
gem 'sqlite3' , group: :development
gem 'haml'
gem 'authlogic'
gem 'paperclip'
gem 'haml-rails'
gem 'jquery-rails'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.5'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end
group :test do
  # Pretty printed test output
  # gem 'turn', '0.8.2', :require => false  
  gem 'cucumber-rails'
  gem 'rspec-rails', '2.7.0'
  gem 'database_cleaner'
  gem 'factory_girl'
end