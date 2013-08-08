class FeelingsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @shelves = @user.shelves.all
    @feelings = @user.feelings.all(:order => "created_at DESC")


    #if want comments on 
    # if params[:feeling_id]
    #   @feeling = current_user.feelings.find(params[:feeling_id])
    # end
  end


  def create
    # resource, id = request.path.split('/')[5, 6]
    # @feeling = current_user.feelings.build(feelable_type: resource.singularize.classify, 
    #                                       feelable_id: id)

    @feeling = current_user.feelings.build(feelable_type: "Item", feelable_id: params[:item_id])
    if @feeling.save
      flash[:success] = "Stir Created"
      redirect_to user_feelings_path(current_user)
    else
      flash[:failure] = "Couldn't create Stir"
      redirect_to user_feelings_path(current_user)
    end
  end

  def destroy
    @feeling = current_user.feelings.find(params[:id])
    if @feeling.destroy
      flash[:success] = "stir destroyed"
    else
      flash[:failure] = "Could not destroy Stir"
    end
    redirect_to user_feelings_path(current_user)      
  end


end
