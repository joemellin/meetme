class UserMailer < ActionMailer::Base
  default from: "mellin.joe@gmail.com"

  def welcome_email(user)
  	@user = user
  	mail(to: "mellin.joe@gmail.com", subject: "NEW VISITOR TO WORK OF JOE")
  end
end
