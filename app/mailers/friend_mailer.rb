class FriendMailer < ActionMailer::Base
  default from: "info@soulstirs.com"
 
  def friend_request_email(user, friend)
    @user = user
    @friend = friend
    @url  = user_friendships_url(@friend.id)
    mail(to: @friend.email, subject: 'You have a friend Request on Soulstirs')
  end  

  def new_card_email(user, friend)
    @user = user
    @friend = friend
    @url  = user_cards_url(@friend.id)
    mail(to: @friend.email, subject: 'You have a new card on Soulstirs')
  end

  def invite_email(user, friend_email)
    @user = user
    @url  = user_shelves_url(@user.id)
    mail(to: friend_email, subject: 'Soulstirs Invite')
  end

end
