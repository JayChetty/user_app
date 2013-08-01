class itemsController < ApplicationController

  def new 
    @user = current_user
    @shelves = current_user.shelves.all
    @shelf = current_user.shelves.find(params[:shelf_id])

    @books = getFromAmazon(title = params[:title], author  = params[:author])
  end

  def create
    @shelf = current_user.shelves.find(params[:shelf_id])
    @item = @shelf.items.build(isbn: params[:book_isbn], author: params[:book_author] ,title: params[:book_title] , image_url: params[:book_image_url], url: params[:url] )
    if @item.save
      flash[:success] = "item Added"
      redirect_to user_shelf_path(current_user, @shelf)
    else
      flash[:failure] = "Could not add item"
      redirect_to new_user_shelf_item_path(current_user, @shelf)
    end 
  end

  def edit
    @shelf = current_user.shelves.find(params[:shelf_id])
    @item = @shelf.items.find(params[:id])
    redirect_to user_shelf_path(current_user, @shelf, item_id: @item.id)

  end

  def update
    @shelf = current_user.shelves.find(params[:shelf_id])
    @item = @shelf.items.find(params[:id])
    if @item.update_attributes(params[:item])
      flash[:success] = "item Updated"
      redirect_to user_shelf_path(current_user, @shelf)
    else
      flash[:failure] = "Could not update item"
      redirect_to edit_user_shelf_item_path(current_user, @shelf, @item)
    end    
  end

  def index
  end

  def show
  end

  def destroy
    @shelf = current_user.shelves.find(params[:shelf_id])
    @item = @shelf.items.find(params[:id])
    if @item.destroy
      flash[:success] = "item destroyed"
    else
      flash[:failure] = "Could not destroy item"
    end
    redirect_to user_shelf_path(current_user, @shelf)  
  end

  private
    def getFromAmazon(title, author)

        country = "us"

        case request.location.country
        when "United Kingdom"
          country = "uk"
        else
          country = "us"
        end
        Amazon::Ecs.item_search(title, :author => author, :country => "uk", :response_group => "Medium", :binding => "paperback").items
    end
end
