class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@reads = @user.reads.paginate(page: params[:page], per_page: 5)
  end

  def index
  	@users = User.all
  end
end
