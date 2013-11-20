class CardMailer < ActionMailer::Base
  default from: "info@soulstirs.com"

  def card_email(user, item, message, email)
    @user = user
    @item = item
    @message = message
    mail(to: email, subject: "Card from #{user.name}")
  end
end
