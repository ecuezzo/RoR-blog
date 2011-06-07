source 'http://rubygems.org'

gem 'rails', '3.0.7'

gem 'sqlite3'
gem "devise", :git => "git://github.com/plataformatec/devise.git"
gem 'jquery-rails'
gem 'simple_form'
gem 'acts-as-taggable-on'
gem 'omniauth'

group :production, :development, :test do
  gem 'kaminari'
  gem "rake", '0.8.7'
end


group :development, :test do
  gem 'spork'
  gem "rspec-rails",        :git => "git://github.com/rspec/rspec-rails.git"
  gem "rspec",              :git => "git://github.com/rspec/rspec.git"
  gem "rspec-core",         :git => "git://github.com/rspec/rspec-core.git"
  gem "rspec-expectations", :git => "git://github.com/rspec/rspec-expectations.git"
  gem "rspec-mocks",        :git => "git://github.com/rspec/rspec-mocks.git"
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'launchy'
  gem 'database_cleaner'
  gem 'simplecov', '>= 0.4.0', :require => false
  gem 'rails_best_practices', :require => false
end
