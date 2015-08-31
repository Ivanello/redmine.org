class LoginPage
  include PageObject
  include DataMagic

  page_url 'http://demo.redmine.org/login'

  text_field :username, id:'username'
  text_field :password, id:'password'
  button :login, name:'login'

  div :warning, id:'flash_error'

  def login_with(username, password)
    self.username = username
    self.password = password
    login
  end

  def messages
    warnings_elements.map{|el| el.text}
    # warnings_elements.map(&:text)
  end

end