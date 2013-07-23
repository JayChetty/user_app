class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	#@memes = @user.memes.paginate(page: params[:page], per_page: 5)
  	#@reads = @user.reads.paginate(page: params[:page], per_page: 5)

  	redirect_to user_memes_path(@user.id)
  end

  def index
  	@users = User.all
  end
end
