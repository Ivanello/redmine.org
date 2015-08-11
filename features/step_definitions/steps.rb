Given(/^I am on Start Page$/) do
  @driver.navigate.to 'http://demo.redmine.org'
  @wait.until { @browser.find_element(:id => 'content').displayed? }
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
  # @browser.find_element(:name, 'commit').click
  # return login
end

Then(/^I have url contain "my\/account" word$/) do |url|
  expect(@driver.current_url).to include url
end

Then(/^I see message$/) do
  expect(@driver.find_element(id: 'flash_notice').displayed?).to be true
end

Then(/^I see message "([^"]*)" message$/) do |message|
  expect(@driver.find_element(id: message).displayed?).to be true
end

When(/^I login with "([^"]*)" login$/) do |login|
  @wait.until { @browser.find_element(:class => 'login').displayed? }
  @browser.find_element(:class, 'login').click
  @browser.find_element(:id, 'username').send_keys login
  @browser.find_element(:id, 'password').send_keys '12345'
  # @browser.find_element(:name,  'login').click
end

Then(/^I see message "([^"]*)" tag a$/) do |tag|
  expect(@driver.find_element(class: tag).displayed?).to be true
end

And(/^I Click "([^"]*)" class button$/) do |clas|
  @browser.find_element(:class, clas).click
end

And(/^I puts old and new pass twice$/) do
  @browser.find_element(:id, 'password').send_keys '12345'
  @browser.find_element(:id, 'new_password').send_keys '1234'
  @browser.find_element(:id, 'new_password_confirmation').send_keys '1234'
end

And(/^I Click "([^"]*)" name button$/) do |name|
  @browser.find_element(:name, name).click
end

And(/^I puts old and new pass twice back$/) do
  @browser.find_element(:id, 'password').send_keys '1234'
  @browser.find_element(:id, 'new_password').send_keys '12345'
  @browser.find_element(:id, 'new_password_confirmation').send_keys '12345'
end