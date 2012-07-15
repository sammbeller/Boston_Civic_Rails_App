class UserMailer < ActionMailer::Base
  default from: "wheresmylane@gmail.com"

  def activation_email(user)
    @user = user
    mail(:to => user.email, :subject => "Welcome to Where's My Lane")
  end

  def updates_email(user, reports)
  	@user = user
  	@reports = reports
  	mail(:to => user.email, :subject => "Where's My Lane Updates")
  end
end
