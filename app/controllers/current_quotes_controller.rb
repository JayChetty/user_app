class CurrentQuotesController < ApplicationController
  def update
  	 @meme = current_user.memes.find(params[:meme_id])
  	 @meme.current_quote_id = params[:id]
  	 if @meme.save
     	flash[:success] = "New Quote Set"
     end
     redirect_to user_meme_quotes_path(current_user, @meme)
  end
end
