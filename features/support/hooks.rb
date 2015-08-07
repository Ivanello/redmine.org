

Before do
  @driver = Selenium::WebDriver.for :firefox
  @browser = @driver
end

After do
  @driver.quit
end