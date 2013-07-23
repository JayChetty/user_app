class ReadsController < ApplicationController
  def new   
    #flash[:success] = "Read Added #{params}"
    @meme = current_user.memes.find(params[:meme_id])
    @search_string = ""
    @search_string = "intitle:#{params[:title]}" if params[:title] && !params[:title].empty? 
    if params[:author] && !params[:author].empty?  
      @search_string << "+" if !@search_string.empty? 
      @search_string <<  "inauthor:#{params[:author]}" 
    end

    #simple search
    # @search_string = ""
    # @search_string = "#{params[:title]}" if params[:title] && !params[:title].empty? 
    # if params[:author] && !params[:author].empty?  
    #   @search_string << " " if !@search_string.empty? 
    #   @search_string <<  "#{params[:author]}" 
    # end

    unless @search_string.empty?  
      @books = GoogleBooks.search(@search_string)
      if @books.none?
        flash.now[:failure] = "No books found with Title: #{params[:title]}, Author: #{params[:author]}"    
      else
        flash.now[:success] = "Books found for Title: #{params[:title]}, Author: #{params[:author]}"    
      end
    else
      flash.now[:success] = "Please enter details"  
    end 
  end

  def create
    @meme = current_user.memes.find(params[:meme_id])
    @read = @meme.reads.build(isbn: params[:book_isbn], author: params[:book_author] ,title: params[:book_title] , image_url: params[:book_image_url] )
     if @read.save
       flash[:success] = "Read Added"
       redirect_to user_meme_reads_path(current_user, @meme)
     else
       flash[:failure] = "Could not add read"
       redirect_to user_meme_reads_path(current_user, @meme)
     end 
  end

  def edit
  end

  def update
  end

  def index
     #flash[:sucess] = "#{params}"
     @user = User.find(params[:user_id]) 
     @meme = @user.memes.find(params[:meme_id])
     @reads = @meme.reads.paginate(page: params[:page], per_page: 5)
  end

  def show
  end

  def destroy
    @meme = current_user.memes.find(params[:meme_id])
    @meme.reads.find(params[:id]).destroy
    flash[:success] = "Read destroyed"
    redirect_to user_meme_path(current_user, @meme)  
  end
end
