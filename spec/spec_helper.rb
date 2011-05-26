require 'simplecov'
SimpleCov.start 'rails'
require 'rubygems'
require 'spork'

#require 'factory_girl'
#Dir.glob(File.dirname(__FILE__) + "/factories/*").each do |factory|
#  require factory
#end

Spork.prefork do

end

Spork.each_run do
  
end


ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rspec'

require 'factory_girl'
Factory.find_definitions

Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  config.mock_with :rspec
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
end
