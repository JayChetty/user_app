class ShelvesController < ApplicationController
  def new
    @user = current_user
    @shelves = @user.shelves.all
    @shelf = @user.shelves.new
  end

  def create
    @shelf = current_user.shelves.build(params[:shelf])
    if @shelf.save
      flash[:success] = "New shelf created"
      redirect_to user_shelf_path(current_user, @shelf)
    else
      flash[:failure] = "Shelf could not be created"
      redirect_to new_user_shelf_path(current_user)
    end
  end

  def edit
  end

  def update
  end

  def show
    @user = User.find(params[:user_id])
    @shelves = @user.shelves.all
    @shelf = @user.shelves.find(params[:id])
  end

  def index
    @user = User.find(params[:user_id])
    @shelves = @user.shelves.all

    if @shelves.empty?
      redirect_to new_user_shelf_path(current_user)
    end
  end

  def destroy
  end
end
