

Before do
  @driver = Selenium::WebDriver.for :firefox
  @browser = @driver
  @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
end

After do
  #@driver.quit
end