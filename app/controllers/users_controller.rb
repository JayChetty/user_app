class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	redirect_to user_shelves_path(@user.id)
  end

  def index
    @users = User.paginate(conditions: ['name LIKE ?', "%#{params[:search]}%"], page: params[:page], per_page: 10)
  end
end
