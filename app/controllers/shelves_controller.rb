class ShelvesController < ApplicationController
  respond_to :json, :html
  before_filter :authenticate_user!
  
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
    @shelf = current_user
    name = params[:shelf][:name]
    if @shelf.update_attribute(:name, name)
      flash[:success] = "Shelf Updated"
      redirect_to user_shelf_path(current_user, @shelf)
    else
      flash[:failure] = "Could not update shelf"
      redirect_to edit_user_shelf_path(current_user, @shelf)
    end
  end

  def show
    @user = current_user 
    @shelves = @user.shelves.all
    @shelf = @user.shelves.find(params[:id])

    #Refactor using scopes
    @reads = @shelf.items.where(medium: 'read')
    @tracks = @shelf.items.where(medium: 'track')
    @shows = @shelf.items.where(medium:'show')    
  end

  def index
    # @user = User.find(params[:user_id])
    @user = current_user    
    @shelves = @user.shelves.all

    # if @shelves.empty? && current_user == @user
    #   redirect_to new_user_shelf_path(current_user)
    # end

    # if @shelves.any?
    #   redirect_to user_shelf_path(@user, @shelves.first)
    # end

    respond_to do |format|
      format.html
      format.json { render :json => @shelves.to_json( :include => :items) }
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
