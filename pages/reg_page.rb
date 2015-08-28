class RegPage
  include PageObject
  include DataMagic

  page_url 'http://demo.redmine.org/account/register'

  @@rnd_login = 'test' + rand(999).to_s

  DEFAULT_DATA={
      login:@@rnd_login,
      pass:1234,
      pass_conf:1234,
      firstname:@@rnd_login,
      lastname:@@rnd_login,
      email:@@rnd_login+'@test.com'
  }

  text_field(:login, id:'user_login')
  text_field(:pass, id:'user_password')
  text_field(:pass_conf, id:'user_password_confirmation')
  text_field(:firstname, id:'user_firstname')
  text_field(:lastname, id:'user_lastname')
  text_field(:email, id:'user_mail')

  button :commit, name:'commit'

  list_items :warnings, css: "#errorExplanation li"

  def register_as(data={})
    data = DEFAULT_DATA.merge(data)
    self.login = data[:login]
    self.pass = data[:pass]
    self.pass_conf = data[:pass_conf]
    self.firstname = data[:firstname ]
    self.lastname = data[:lastname ]
    self.email = data[:email]
    commit
  end

  def messages
    warnings_elements.map{|el| el.text}
    # warnings_elements.map(&:text)
  end

end