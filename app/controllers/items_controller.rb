class ItemsController < ApplicationController
  respond_to :json, :html
  before_filter :authenticate_user!

  def new 
    if params[:title] || params[:creator]
      puts("searching amazon")
      @xml_items = getFromAmazon(title = params[:title], creator = params[:creator], medium = params[:medium])

      creator_hash = {read: "Author", } 

       case params[:medium]
       when "read"
         creator = 'Author'
       when "track"
         # creator = 'Creator' || item.get("ItemAttributes/Artist")
         creator = 'Creator'
       when "show" 
         creator = 'Actor'
       end 

      @items = @xml_items.map do |item|
        item = Item.new(creator: item.get("ItemAttributes/#{creator}") ,title: item.get('ItemAttributes/Title'), 
        image_url: item.get("SmallImage/URL"), url: item.get("DetailPageURL"), medium: params[:medium])  
      end

      # if params[:medium] == 'track' && !item.creator
      #   item.update_attribute(:creator, item.get("ItemAttributes/Artist"))
      # end

    end
    respond_to do |format|
      format.html do
        @user = current_user
        @shelves = current_user.shelves.all
        @shelf = current_user.shelves.find(params[:shelf_id])
      end
      format.json do
        render :json => @items.to_json
      end
    end    
  end

  def create
    @shelf = current_user.shelves.find(params[:shelf_id])
    #@item = @shelf.items.build(creator: params[:creator] ,title: params[:title] , image_url: params[:image_url], url: params[:url], medium: params[:medium]  )
    @item = @shelf.items.build(creator: params[:item][:creator] ,title: params[:item][:title] , image_url: params[:item][:image_url], url: params[:item][:url], medium: params[:item][:medium]  )
    
    if @item.save
      flash[:success] = "Item Added"
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
    shelf = current_user.shelves.find(params[:shelf_id])
    @items = shelf.items
    respond_to do |format|
      format.html
      format.json { render :json => @items.to_json }
    end    
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
      when "show"
         result = Amazon::Ecs.item_search(title, :actor => creator, :country => "uk", :response_group => "Medium", :search_index => "DVD").items
         #result = Amazon::Ecs.item_search("#{title} #{creator}", :country => "uk", :response_group => "Medium").items 
      end

      result
    end
end

