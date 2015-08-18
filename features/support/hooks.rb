

Before do
  @browser ⇒  Selenium::WebDriver.for :firefox
  @driver= @browser
  @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
end

After do
  #@driver.quit
end