ENV['RACK_ENV'] = 'test'
require './app/app'
require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'
require_relative 'helpers/web_helpers.rb'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
SimpleCov::Formatter::Console,
])
SimpleCov.start

Capybara.app = MakersBnB

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
end
