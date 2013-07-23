class QuotesController < ApplicationController
  def new
  end

  def create
    @meme = current_user.memes.find(params[:meme_id])
    @quote = @meme.quotes.build(params[:quote])
    if @quote.save
      flash[:success] = "New Quote created"
      # if @meme.quotes.size == 1 
      #   @meme.current_quote_id = @quote.id
      #   @meme.save
      # end
      redirect_to user_meme_quotes_path(current_user, @meme)
    else
      @user = current_user
      @quotes = @meme.quotes.all
      render action: "index"
    end    
  end

  def edit


  end

  def destroy
    @meme = current_user.memes.find(params[:meme_id])
    @quote = @meme.quotes.find(params[:id])
    if @quote.destroy
      flash[:success] = "Quote destroyed"
    else
      flash[:failure] = "Cannot destroy current quote"
    end if
    redirect_to user_meme_quotes_path(current_user, @meme)
  end

  def index
  	@user = User.find(params[:user_id])
    @meme = @user.memes.find(params[:meme_id])
    @quotes = @meme.quotes.all
    @quote = @meme.quotes.build
  end

end
