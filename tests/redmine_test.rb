require 'selenium-webdriver'
require 'test/unit'
require_relative '../helper_methods'

class RedMineTest < Test::Unit::TestCase
  include Helper_Method

  def setup
    @browser = Selenium::WebDriver.for :firefox
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  end

#def teardown
#@browser.quit
#end

  def test1_registration
    go_to_home_page
    register
    expected = 'Your account has been activated. You can now log in.'
    assert_equal(true, @browser.find_element(:id, 'flash_notice').displayed?)
  end

  def test2_login_out
    go_to_home_page
    login=register
    logout
    @browser.find_element(:class, 'login').click
    @browser.find_element(:id, 'username').send_keys login
    @browser.find_element(:id, 'password').send_keys '1234'
    @browser.find_element(:name,  'login').click
    assert_equal(true, @browser.find_element(:class, 'user').displayed?)
    logout
    assert_equal(true, @browser.find_element(:class, 'login').displayed?)
  end

  def test3_change_pass
    go_to_home_page
    register
    @browser.find_element(:class, 'my-account').click
    @browser.find_element(:class, 'icon-passwd').click
    @browser.find_element(:id, 'password').send_keys '1234'
    @browser.find_element(:id, 'new_password').send_keys '12345'
    @browser.find_element(:id, 'new_password_confirmation').send_keys '12345'
    @browser.find_element(:name, 'commit').click
    assert_equal(true, @browser.find_element(:id, 'flash_notice').displayed?)
#   <div class="flash notice" id="flash_notice">Password was successfully updated.</div>
  end

  def test4_create_project
    go_to_home_page
    register
    cr_project
    assert_equal(true, @browser.find_element(:id, 'flash_notice').displayed?)
#    <div class="flash notice" id="flash_notice">Successful creation.</div>
  end

  def test5_adduser_toproject
    go_to_home_page
    user_to_add=register
    logout
    register
    cr_project
    @browser.find_element(:id, 'tab-members').click
    @browser.find_element(:class, 'icon-add').click
    @wait.until { @browser.find_element(:id => 'principal_search').displayed? }
    @browser.find_element(:id, 'principal_search').send_keys user_to_add
    @wait.until { @browser.find_elements(:name => "membership[user_ids][]").count == 1 }
    @browser.find_element(:name, "membership[user_ids][]").click
    @browser.find_elements(:css, '.roles-selection label')[0].click
    @browser.find_element(:id, 'member-add-submit').click
    @wait.until { @browser.find_elements(:class => 'icon-edit').size>1 }
    assert_equal(true,(@browser.find_elements(:class, 'icon-edit').size)==2)



  end

  def test6_adduser_toproject
    go_to_home_page
    @user_to_add=register
    logout
    register
    cr_project
    add_user2proj

    @browser.find_elements(:class, 'icon-edit')[1].click
    @browser.find_elements(:css, '.roles label')[4].click
    @browser.find_element(:css, ".even member>input[type = 'submit']").click

    # @browser.find_element(:id, 'tab-members').click
    @browser.find_elements(:class, 'icon-edit')[1].click
    @browser.find_elements(:css, '.roles label')[4].click

    # array = @browser.find_elements(:css, '.roles-selection label') = Array (3 elements)
    # array.map!{|el| el.text} = Array (3 elements)
    # index = array.index('Manager') = 0
    # @browser.find_elements(:css, '.roles-selection label')[index].find_element(:tag_name, 'input').click = "ok"

    membership[role_ids][]
    <input name="membership[role_ids][]" value="3" checked="checked" type="checkbox">
  end


end

