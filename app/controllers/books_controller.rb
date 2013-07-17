class BooksController < ApplicationController
  def index
    unless params[:title].nil? or params[:title].empty? 			
  	  @books = GoogleBooks.search("#{params[:title]}")
  		unless @books.none?
  		  flash.now[:success] = "Books found for title #{params[:title]}"
  		else
  		  flash.now[:failure] = "No books found with title #{params[:title]}"	
  		end
  	end
  end

  def show
  end
end
