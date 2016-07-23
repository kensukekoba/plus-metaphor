class MetaphorMailer < ApplicationMailer

  def add_metaphor(user)
    @user = user
    @url = 'https://techacademy-kensukekoba.c9users.io/login'
    mail(to: @user.email, subject: '新たな比喩が追加されました!')
  end
end
