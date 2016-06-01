class UserMailer < ApplicationMailer
  default from: ENV["SMTP_USER_NAME"]
  
  def welcome_email(user)
    @user = user
    @url = 'https://techacademy-kensukekoba.c9users.io/login'
    mail(to: @user.email, subject: 'Welcome to 比喩ジャクマン')
  end
  
end
