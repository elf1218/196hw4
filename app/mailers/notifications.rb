class Notifications < ActionMailer::Base
  default from: "kevinmu@cis196calendar.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.new_event.subject
  #
  def new_event(event)
    @greeting = "Hello!"
    @id = event.id
    @desc = event.desc
    @title = event.calendar.title
    mail to: event.calendar.user.email
  end
end
