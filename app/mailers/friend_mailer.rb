class FriendMailer < ActionMailer::Base
  default from: "jay@soulstirs.com"
 
  def friend_request_email(user, friend)
    @user = user
    @friend = friend
    @url  = user_friendships_url(@friend.id)
    mail(to: @friend.email, subject: 'You have a friend Request on Soulstirs')
  end  
end
