class QuotesController < ApplicationController
  def new
  end

  def create
    @user = current_user
    @quote = current_user.quotes.build(params[:quote])
    if @quote.save
      flash[:success] = "New Quote created"
      redirect_to user_quotes_path(current_user)
    else
      @quotes = current_user.quotes.all
      render action: "index"
    end    
  end

  def edit


  end

  def destroy
    @quote = current_user.quotes.find(params[:id])
    if @quote.destroy
      flash[:success] = "Quote destroyed"
    else
      flash[:failure] = "Cannot destroy current quote"
    end if
    redirect_to user_quotes_path(current_user)
  end

  def index
  	@user = User.find(params[:user_id])
    @quotes = @user.quotes.all
    @quote = @user.quotes.build
  end

end
