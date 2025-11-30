# features/support/env.rb
ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../../config/environment', __FILE__)

require 'cucumber/rails'

Capybara.default_driver = :rack_test
Capybara.javascript_driver = :selenium_chrome_headless

ActionController::Base.allow_rescue = false

# Limpa o banco entre cenários
begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "Add database_cleaner-active_record to your Gemfile"
end

Cucumber::Rails::Database.autorun_database_cleaner = true
