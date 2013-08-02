class FeelingsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @shelves = @user.shelves.all
    @feelings = @user.feelings.all
  end

  def new
  	@user = User.find(params[:user_id])
  	@shelves = current_user.shelves.all
    @shelf = current_user.shelves.find(params[:shelf_id])
    resource, id = request.path.split('/')[5, 6]
    @feelable = resource.singularize.classify.constantize.find(id)
    @feeling = current_user.feelings.new
    flash.now[:success] = "feelable #{@feelable.class}"
  end

  def create
    resource, id = request.path.split('/')[5, 6]
    flash.now[:success] = "#{params}"
    @feeling = current_user.feelings.build(feelable_type: resource.singularize.classify, 
                                          feelable_id: id)
    if @feeling.save
      flash[:success] = "Feeling Created"
      redirect_to user_path(current_user)
    else
      flash[:failure] = "Couldn't create feeling"
      redirect_to user_path(current_user)
    end

  end
end
