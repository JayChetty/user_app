class ReadsController < ApplicationController
  def new   
    flash[:success] = "Read Added #{params}"
    @read = current_user.reads.build(isbn: params[:book_isbn], author: params[:book_author] ,title: params[:book_title] , image_url: params[:book_image_url] )
     if @read.save
       flash[:success] = "Read Added"
       redirect_to user_path(current_user)
     else
       flash[:failure] = "Could not add flash"
       redirect_to books_path
     end     
  end

  def create

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
    current_user.reads.find(params[:id]).destroy
    flash[:success] = "Read destroyed"
    redirect_to user_path(current_user)  
  end
end
