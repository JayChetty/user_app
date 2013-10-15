class FriendMailer < ActionMailer::Base
  default from: "from@example.com"
 
  def friend_request_email(user, friend)
    @user = user
    @friend = friend
    @url  = 'http://www.google.com'
    mail(to: @friend.email, subject: 'You have a friend Request on Soulstirs')
  end  
end
