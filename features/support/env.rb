require 'cucumber/rails'
require 'capybara-screenshot/cucumber'

ActionController::Base.allow_rescue = false

begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

Cucumber::Rails::Database.javascript_strategy = :truncation

Capybara.javascript_driver = :webkit

Capybara.default_wait_time = 10

def retry_if_fails(&block)
  begin
    yield(block)
  rescue
    sleep(1)
    yield(block)
  end
end
