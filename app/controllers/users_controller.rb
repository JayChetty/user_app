class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	#@memes = @user.memes.paginate(page: params[:page], per_page: 5)
  	#@reads = @user.reads.paginate(page: params[:page], per_page: 5)
  	redirect_to user_shelves_path(@user.id)
  	#redirect_to user_reads_path(@user.id)
  end

  def index
  	#@users = User.find(:all, conditions: ['name LIKE ?', "%#{params[:search]}%"]).paginate(page: params[:page], per_page: 10)

    @users = User.paginate(conditions: ['name LIKE ?', "%#{params[:search]}%"], page: params[:page], per_page: 10)
  end
end
