class HomePage
  include PageObject

  page_url 'http://demo.redmine.org/'

  # link :reg_user, css: '#loggedas .user'
  # div :flash_notice, id:'flash_notice'

  # <div class="flash notice" id="flash_notice">Ваша учётная запись активирована. Вы можете войти.</div>

  def logged_in?
    reg_user_element.visible?
  end
end