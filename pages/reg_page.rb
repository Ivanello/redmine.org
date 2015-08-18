class RegPage
  include PageObject

  DEFAUL_DATA={



  }


  text_field(:user_login, id:'user_login')
  text_field(:user_password, id:'user_password')
  text_field(:user_password_confirmation, id:'user_password_confirmation')
  text_field(:user_firstname, id:'user_firstname')
  text_field(:user_lastname, id:'user_lastname')
  text_field(:user_mail, id:'user_mail')

  button :commit id:'commit'

  def registration(data)
    login = 'ivan' + rand(9999).to_s
    self.user_login  = data['user_login']
    self.user_password  = data['user_password']
    self.user_password_confirmation  = data['user_password_confirmation']
    self.user_firstname  = data['user_firstname']
    self.user_lastname  = data['user_lastname']
    self.user_mail  = data['user_mail']
    commit
  end

end