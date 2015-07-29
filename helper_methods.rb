module Helper_Method
  def go_to_home_page
    @browser.get 'http://demo.redmine.org'
  end

  def login_ivanello
    @browser.find_element(:class, 'login').click
    @browser.find_element(:id, 'username').send_keys 'ivanello'
    @browser.find_element(:id, 'password').send_keys '1234'
    @browser.find_element(:name,  'login').click
  end

  def register
    login = 'ivan' + rand(9999).to_s
    @browser.find_element(:class, 'register').click
    @browser.find_element(:id, 'user_login').send_keys login
    @browser.find_element(:id, 'user_password').send_keys '1234'
    @browser.find_element(:id, 'user_password_confirmation').send_keys '1234'
    @browser.find_element(:id, 'user_firstname').send_keys 'itlabs'
    @browser.find_element(:id, 'user_lastname').send_keys 'ruby'
    @browser.find_element(:id, 'user_mail').send_keys login + '@blabla.com'
    @browser.find_element(:name, 'commit').click
    user_id = @browser.find_element(:class, 'active').attribute('href')
    # <a class="user active" href="/users/114158">ivanello</a>
    # puts user_id
    return login
  end

  def logout
    @browser.find_element(:class, 'logout').click
  end

  def cr_project
    proj = 'proj' + rand(999).to_s
    @browser.find_element(:class, 'projects').click
    @browser.find_element(:class, 'icon-add').click
    sleep 2
    @browser.find_element(:id, 'project_name').send_keys proj
    @browser.find_element(:name, 'commit').click
  end

  def click_commit
    @browser.find_element(:name, 'commit').click
  end

  def wait_ntil_visible(opt={})
    @wait.until {}
  end

  def add_user2proj
    @browser.find_element(:id, 'tab-members').click
    @browser.find_element(:class, 'icon-add').click
    @wait.until { @browser.find_element(:id => 'principal_search').displayed? }
    @browser.find_element(:id, 'principal_search').send_keys @user_to_add
    @wait.until { @browser.find_elements(:name => "membership[user_ids][]").count == 1 }
    @browser.find_element(:name, "membership[user_ids][]").click
    @browser.find_elements(:css, '.roles-selection label')[0].click
    @browser.find_element(:id, 'member-add-submit').click
    @wait.until { @browser.find_elements(:class => 'icon-edit').size>1 }
    # assert_equal(true,(@browser.find_elements(:class, 'icon-edit').size)==2)
  end

end