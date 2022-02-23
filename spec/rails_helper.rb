require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|

  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end

Capybara.register_driver :selenium_remote do |app|
  driver = Capybara::Selenium::Driver.new(
      app,
      browser: :remote,
        desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
            chromeOptions: {
                args: [
                    'window-size=500,500', #念の為サイズも小さく
                    'headless',
                    '--no-sandbox', # crush回避
                    '--disable-dev-shm-usage' # crush回避
                ]
            }
        ),
        url: url,
    )
  Capybara::Selenium::Driver.new(app, browser: :remote, url: url, capabilities: capabilities)
end
