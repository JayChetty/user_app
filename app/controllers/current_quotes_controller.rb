class CurrentQuotesController < ApplicationController
  def update
  	 current_user.current_quote_id = params[:id]
  	 if current_user.save
     	flash[:success] = "New Quote Set"
     end
     redirect_to user_quotes_path(current_user)
  end
end
