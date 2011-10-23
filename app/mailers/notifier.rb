class Notifier < ActionMailer::Base
  default :from => "time-tracker@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.welcome.subject
  #
  def welcome(user, password)
    @user = user
    @password = password
    mail :to => user.email, :subject => "Welcome Message"
  end
end
