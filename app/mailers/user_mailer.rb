class UserMailer < ApplicationMailer
  default from: 'hpultimatemedia@gmail.com'
 
  def welcome_email(email)
    
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
