class FriendshipsController < ApplicationController
	def index
		puts "the current user is #{current_user.class}"
		if !current_user
			session[:target] = 'friendships'
			redirect_to new_user_session_path
			return false
		end
		@user = current_user

	  @friendships_pend = @user.friendships.where(status: 'pending')
		@friendships_req = @user.friendships.where(status: 'requested')
		@friendships_conf = @user.friendships.where(status: 'confirmed')

		@friends = @user.friends
	end	


  def create
	  @friend = User.find(params[:friend_id])
	  if current_user.request_friend(@friend)
	  	puts 'requesting friendship'
	  	FriendMailer.friend_request_email(current_user, @friend).deliver
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

  def invite
  	friend_email = params[:friend_email]
  	if FriendMailer.invite_email(current_user, friend_email).deliver
  		flash[:notice] = "Friend invited #{friend_email}"
  	end
  	redirect_to user_friendships_path(current_user)
  end
end
