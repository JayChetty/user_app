# class BooksController < ApplicationController
#   def index
#     #explicit defined
#     @search_string = ""
#     @search_string = "intitle:#{params[:title]}" if params[:title] && !params[:title].empty? 
#     if params[:author] && !params[:author].empty?  
#       @search_string << "+" if !@search_string.empty? 
#       @search_string <<  "inauthor:#{params[:author]}" 
#     end

#     #simple seems to work better
#     # @search_string = ""
#     # @search_string = "#{params[:title]}" if params[:title] && !params[:title].empty? 
#     # if params[:author] && !params[:author].empty?  
#     #   @search_string << " " if !@search_string.empty? 
#     #   @search_string <<  "#{params[:author]}" 
#     # end

#     unless @search_string.empty?	
#   	  @books = GoogleBooks.search(@search_string)
#   		if @books.none?
#         flash.now[:failure] = "No books found with Title: #{params[:title]}, Author: #{params[:author]}" 	  
#   		else
#   		  flash.now[:success] = "Books found for Title: #{params[:title]}, Author: #{params[:author]}"    
#   		end
#     else
#       flash.now[:success] = "Please enter details"  
#   	end 

#     redirect_to controller: :reads, action: :new, books:@books
#   end

#   def show
#   end
# end
