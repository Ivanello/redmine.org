Given(/^I am on Start Page$/) do
  @driver.navigate.to 'http://demo.redmine.org'
end

When(/^I click "([^"]*)" link$/) do |link_name|
  @driver.find_element(link_text: link_name).click
end


Then(/^I am on Registraion Page$/) do
  expect(@driver.current_url).to include 'register'
end

When(/^I fill up registration fields$/) do
  login = 'ivan' + rand(999).to_s
  @browser.find_element(:id, 'user_login').send_keys login
  @browser.find_element(:id, 'user_password').send_keys '1234'
  @browser.find_element(:id, 'user_password_confirmation').send_keys '1234'
  @browser.find_element(:id, 'user_firstname').send_keys login
  @browser.find_element(:id, 'user_lastname').send_keys login
  @browser.find_element(:id, 'user_mail').send_keys login + '@blabla.com'
  @browser.find_element(:name, 'commit').click
  return login
end

And(/^Click "([^"]*)" button$/) do |button_name|
  @driver.find_element(link_text: button_name).click
end

Then(/^I have flash\-notice$/) do
  assert_equal(true, @browser.find_element(:id, 'flash_notice').displayed?)
end