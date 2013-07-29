class ReadsController < ApplicationController

  def new 
    @user = current_user
    @shelves = current_user.shelves.all
    @shelf = current_user.shelves.find(params[:shelf_id])

    @books = getFromAmazon(title = params[:title], author  = params[:author])
  end

  def create
    @shelf = current_user.shelves.find(params[:shelf_id])
    @read = @shelf.reads.build(isbn: params[:book_isbn], author: params[:book_author] ,title: params[:book_title] , image_url: params[:book_image_url], url: params[:url] )
    if @read.save
      flash[:success] = "Read Added"
      redirect_to user_shelf_path(current_user, @shelf)
    else
      flash[:failure] = "Could not add read"
      redirect_to new_user_shelf_read_path(current_user, @shelf)
    end 
  end

  def edit
    @shelf = current_user.shelves.find(params[:shelf_id])
    @read = @shelf.reads.find(params[:id])
    #flash[:success] = "#{params}"
    #flash[:success] = "#{@read}"
    redirect_to user_shelf_path(current_user, @shelf, read_id: @read.id)

  end

  def update
    @shelf = current_user.shelves.find(params[:shelf_id])
    @read = @shelf.reads.find(params[:id])
    if @read.update_attributes(params[:read])
      flash[:success] = "Read Updated"
      redirect_to user_shelf_path(current_user, @shelf)
    else
      flash[:failure] = "Could not update Read"
      redirect_to edit_user_shelf_read_path(current_user, @shelf, @read)
    end    
  end

  def index
  end

  def show
  end

  def destroy
    @shelf = current_user.shelves.find(params[:shelf_id])
    @read = @shelf.reads.find(params[:id])
    if @read.destroy
      flash[:success] = "Read destroyed"
    else
      flash[:failure] = "Could not destroy read"
    end
    redirect_to user_shelf_path(current_user, @shelf)  
  end

  private
    def getFromAmazon(title, author)

        # country = "us"

        # case request.location.country
        # when "United Kingdom"
        #   country = "uk"
        # else
        #   country = "us"
        # end
        Amazon::Ecs.item_search(title, :author => author, :country => "uk", :response_group => "Medium", :binding => "paperback").items
    end
end
