Capybara.default_max_wait_time = 3 # seconds

# Capybara.register_driver :chrome do |app|
#   Capybara::Selenium::Driver.new(app, :browser => :chrome)
# end

Capybara.javascript_driver = :chrome
