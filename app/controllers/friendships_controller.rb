class FriendshipsController < ApplicationController

	def index
		@user = current_user

	    @friendships_pend = @user.friendships.where(status: 'pending')
		@friendships_req = @user.friendships.where(status: 'requested')
		@friendships_conf = @user.friendships.where(status: 'confirmed')

		@friends = @user.friends
	end	


  def create
	  @friend = User.find(params[:friend_id])
	  if current_user.request_friend(@friend)
	  	FriendMailer.friend_request_email(current_user, @friend)
	    flash.keep[:notice] = "Friendship Requested"
	    redirect_to user_path(@friend)
	  else
	    flash.keep[:error] = "Could not Request"
	    redirect_to user_path(@friend)
	  end  	
  end

	def update
		@friend = User.find(params[:friend_id])
		if current_user.confirm_friend(@friend)
			flash[:success] = "Friend Confirmed"
		else
			flash[:error] = "Could not confirm friend"
		end
		redirect_to user_friendships_path(current_user)
	end

  def destroy
	  @friendship = current_user.friendships.find(params[:id])
	  @inverse = current_user.inverse_friendships.where(user_id: @friendship.friend_id).first
	  @friendship.destroy
	  @inverse.destroy
	  flash[:notice] = "Removed friendship."
	  redirect_to user_friendships_path(current_user)
  end
end
