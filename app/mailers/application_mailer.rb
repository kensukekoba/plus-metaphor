class ApplicationMailer < ActionMailer::Base
  default from: ENV["SMTP_USER_NAME"]
  
end
