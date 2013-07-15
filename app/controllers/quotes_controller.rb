class QuotesController < ApplicationController
  def new
  end

  def create
    @quote = current_user.quotes.build(params[:quote])
    if @quote.save
      flash[:success] = "New Quote created"
    end
    redirect_to user_quotes_path(current_user)
  end

  def destroy
  end

  def index
  	@user = User.find(params[:user_id])
    @quotes = @user.quotes.all
  end
end
