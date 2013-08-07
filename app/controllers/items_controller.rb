class ItemsController < ApplicationController

  def new 
    @user = current_user
    @shelves = current_user.shelves.all
    @shelf = current_user.shelves.find(params[:shelf_id])

    @items = getFromAmazon(title = params[:title], creator  = params[:creator], medium = params[:medium])

  end

  def create
    @shelf = current_user.shelves.find(params[:shelf_id])
    @item = @shelf.items.build(creator: params[:creator] ,title: params[:title] , image_url: params[:image_url], url: params[:url], medium: params[:medium]  )
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
    def getFromAmazon(title, creator, medium)

      country = "us"

      case request.location.country
      when "United Kingdom"
        country = "uk"
      else
        country = "us"
      end
     	
     	case medium
     	when "read"
      	result = Amazon::Ecs.item_search(title, :author => creator, :country => "uk", :response_group => "Medium", :binding => "paperback").items
      when "track"

      	result = Amazon::Ecs.item_search("#{title} #{creator}", :country => "uk", :response_group => "Medium", :search_index => "MP3Downloads").items

        if result.empty?
           result = Amazon::Ecs.item_search(title, :artist => creator, :country => "uk", :response_group => "Medium", :search_index => "Music").items
        end
      end

      result
    end
end

