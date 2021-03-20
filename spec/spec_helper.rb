# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)

require 'rspec/rails'

require 'capybara/rails'
require 'capybara/rspec'
# require 'capybara/email/rspec'

# require 'capybara/poltergeist'
# Capybara.javascript_driver = :poltergeist
# #Capybara.javascript_driver = :webkit
# Capybara.register_driver :poltergeist do |app|
#   Capybara::Poltergeist::Driver.new(app, js_errors: false,
#                                          debug: false)
# end

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  # config.include FactoryGirl::Syntax::Methods

  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.infer_spec_type_from_file_location!

  config.use_transactional_fixtures = false
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"

  config.include InitHelper
  config.include Capybara::DSL

  config.before(:suite) do
    if Rails.env.staging_performance_test?
      DatabaseCleaner.strategy = :transaction
      DatabaseCleaner.clean_with(:transaction)
    else
      DatabaseCleaner.strategy = :truncation
      DatabaseCleaner.clean_with(:truncation)
    end
  end

  config.before(:each) do
    DatabaseCleaner.start
    load "#{Rails.root}/db/seeds.rb"
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end

