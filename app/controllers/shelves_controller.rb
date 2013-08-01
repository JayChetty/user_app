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
    @user = current_user
    @shelves = @user.shelves.all
    @shelf = @user.shelves.find(params[:id])

  end

  def update
    @shelf = current_user.shelves.find(params[:id])
    if @shelf.update_attributes(params[:shelf])
      flash[:success] = "Shelf Updated"
      redirect_to user_shelf_path(current_user, @shelf)
    else
      flash[:failure] = "Could not update shelf"
      redirect_to edit_user_shelf_path(current_user, @shelf)
    end
  end

  def show
    @user = User.find(params[:user_id])
    @shelves = @user.shelves.all
    @shelf = @user.shelves.find(params[:id])
    @reads = @shelf.reads.paginate(page: params[:page], per_page: 5)
    @tracks = @shelf.tracks.paginate(page: params[:page], per_page: 5)
    # if params[:read_id]
    #   @read = @shelf.reads.find(params[:read_id]) 
    # end

  end

  def index
    @user = User.find(params[:user_id])
    @shelves = @user.shelves.all

    if @shelves.empty? && current_user == @user
      redirect_to new_user_shelf_path(current_user)
    end

    if @shelves.any?
      redirect_to user_shelf_path(@user, @shelves.first)
    end

  end

  def destroy
    @shelf = current_user.shelves.find(params[:id])
    if @shelf.destroy
      flash[:success] = "Shelf destroyed"
    else
      flash[:failure] = "Could not destroy Shelf"
    end
    redirect_to user_shelves_path(current_user)      
  end
end
