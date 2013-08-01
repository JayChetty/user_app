class TracksController < ApplicationController

  def new 
    @user = current_user
    @shelves = current_user.shelves.all
    @shelf = current_user.shelves.find(params[:shelf_id])

    @tracks = getFromAmazon(title = params[:title], artist = params[:artist]) if (params[:title] or params[:artist])
  end

  def create
    @shelf = current_user.shelves.find(params[:shelf_id])
    @track = @shelf.tracks.build(artist: params[:track_artist] ,title: params[:track_title] , image_url: params[:track_image_url], url: params[:url] )
    if @track.save
      flash[:success] = "Track Added"
      redirect_to user_shelf_path(current_user, @shelf)
    else
      flash[:failure] = "Could not add Track"
      redirect_to new_user_shelf_track_path(current_user, @shelf)
    end 
  end

  def edit
    @shelf = current_user.shelves.find(params[:shelf_id])
    @track = @shelf.tracks.find(params[:id])
    redirect_to user_shelf_path(current_user, @shelf, track_id: @track.id)

  end

  def update
    @shelf = current_user.shelves.find(params[:shelf_id])
    @track = @shelf.tracks.find(params[:id])
    if @track.update_attributes(params[:track])
      flash[:success] = "track Updated"
      redirect_to user_shelf_path(current_user, @shelf)
    else
      flash[:failure] = "Could not update track"
      redirect_to edit_user_shelf_track_path(current_user, @shelf, @track)
    end    
  end

  def index
  end

  def show
  end

  def destroy
    @shelf = current_user.shelves.find(params[:shelf_id])
    @track = @shelf.tracks.find(params[:id])
    if @track.destroy
      flash[:success] = "track destroyed"
    else
      flash[:failure] = "Could not destroy track"
    end
    redirect_to user_shelf_path(current_user, @shelf)  
  end

  private
    def getFromAmazon(title, artist)

        country = "us"

        case request.location.country
        when "United Kingdom"
          country = "uk"
        else
          country = "us"
        end

          result = Amazon::Ecs.item_search("#{title} #{artist}", :country => "uk", :response_group => "Medium", :search_index => "MP3Downloads").items

          if result.empty?
             result = Amazon::Ecs.item_search(title, :artist => artist, :country => "uk", :response_group => "Medium", :search_index => "Music").items
          end

        result
    end
end


