ENV["RAILS_ENV"] ||= "test"

require File.expand_path("../../config/environment", __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require "spec_helper"
require "rspec/rails"
# Add additional requires below this line. Rails is not loaded until this point!
require "capybara/rspec"

# Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

Capybara.register_driver :selenium_chrome do |app|
 Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.javascript_driver = :selenium_chrome
RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  # config.use_transactional_fixtures = false
  # config.infer_spec_type_from_file_location!
  # config.filter_rails_from_backtrace!

  config.include FactoryBot::Syntax::Methods
end
Capybara.default_driver = :selenium_chrome
Capybara.configure do |c|
  c.javascript_driver = :selenium_chrome
  c.default_driver = :selenium_chrome
end
