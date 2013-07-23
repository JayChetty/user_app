class MemesController < ApplicationController
  def index
    @user = User.find(params[:user_id]) 
    @memes = @user.memes.all
  end

  def show
    @user = User.find(params[:user_id]) 
    @meme = @user.memes.find(params[:id])

    redirect_to user_meme_reads_path(@user, @meme)
  end

  def new
    flash[:success] = "#{params}"
  end

  def create
    flash[:success] = "#{params}"
    @user = User.find(params[:user_id]) 
    @meme = @user.memes.new
    if @meme.save
      flash[:success] = "New Meme Created"
    else 
      flash[:failure] = "Could not create meme"
    end
    redirect_to user_memes_path(@user)
  end

  def edit
    #flash[:success] = "#{params}"
    @user = User.find(params[:user_id])
    @meme = @user.memes.find(params[:id])
    @quote = @meme.quotes.build
  end

  def update
  end

  def destroy
  end

end
