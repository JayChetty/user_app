class QuotesController < ApplicationController
  def new
  end

  def create
    @quote = current_user.quotes.build(params[:quote])
    if @quote.save
      flash[:success] = "New Quote created"
      if current_user.quotes.size == 1 
        current_user.current_quote_id = @quote.id
        current_user.save
      end
    end
    redirect_to user_quotes_path(current_user)
  end

  def destroy
    current_user.quotes.find(params[:id]).destroy
    flash[:success] = "Quote destroyed"
    redirect_to user_quotes_path(current_user)
  end

  def index
  	@user = User.find(params[:user_id])
    @quotes = @user.quotes.all
  end

end
