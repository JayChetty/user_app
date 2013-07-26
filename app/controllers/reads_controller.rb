class ReadsController < ApplicationController
  def new   
    #flash[:success] = "Read Added #{params}"
    @user = current_user
    @shelves = current_user.shelves.all
    @shelf = current_user.shelves.find(params[:shelf_id])
    # @search_string = ""
    # @search_string = "intitle:#{params[:title]}" if params[:title] && !params[:title].empty? 
    # if params[:author] && !params[:author].empty?  
    #   @search_string << "+" if !@search_string.empty? 
    #   @search_string <<  "inauthor:#{params[:author]}" 
    # end

    #simple search
    @search_string = ""
    @search_string = "#{params[:title]}" if params[:title] && !params[:title].empty? 
    if params[:author] && !params[:author].empty?  
      @search_string << " " if !@search_string.empty? 
      @search_string <<  "inauthor:#{params[:author]}" 
    end

    unless @search_string.empty?  
      @books = GoogleBooks.search(@search_string, count: 20)
      if @books.none?
        flash.now[:failure] = "No books found with Title: #{params[:title]}, Author: #{params[:author]}"    
      else
        flash.now[:success] = "Books found for Title: #{params[:title]}, Author: #{params[:author]}"    
      end
    else
      #flash.now[:success] = "Please enter details"  
    end 
  end

  def create
    @shelf = current_user.shelves.find(params[:shelf_id])
    @read = @shelf.reads.build(isbn: params[:book_isbn], author: params[:book_author] ,title: params[:book_title] , image_url: params[:book_image_url] )
    if @read.save
      flash[:success] = "Read Added"
      redirect_to user_shelf_path(current_user, @shelf)
    else
      flash[:failure] = "Could not add read"
      redirect_to new_user_shelf_read_path(current_user, @shelf)
    end 
  end

  def edit
  end

  def update
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
end
