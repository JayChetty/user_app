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

  # def new
  # 	@user = User.find(params[:user_id])
  # 	@shelves = current_user.shelves.all
  #   @shelf = current_user.shelves.find(params[:shelf_id])
  #   # resource, id = request.path.split('/')[5, 6]
  #   # @feelable = resource.singularize.classify.constantize.find(id)
  #   @feeling = current_user.feelings.new
  #   flash.now[:success] = "feelable #{@feelable.class}"
  # end

  def create
    # resource, id = request.path.split('/')[5, 6]
    # @feeling = current_user.feelings.build(feelable_type: resource.singularize.classify, 
    #                                       feelable_id: id)

    @feeling = current_user.feelings.build(feelable_type: "Item", feelable_id: params[:item_id])
    if @feeling.save
      flash[:success] = "Feeling Created"
      redirect_to user_feelings_path(current_user)
    else
      flash[:failure] = "Couldn't create feeling"
      redirect_to user_feelings_path(current_user)
    end
  end

  def destroy
    @feeling = current_user.feelings.find(params[:id])
    if @feeling.destroy
      flash[:success] = "Feeling destroyed"
    else
      flash[:failure] = "Could not destroy Feeling"
    end
    redirect_to user_feelings_path(current_user)      
  end

  # def edit
  #   #flash[:success] = " lala #{params}"
  #   #redirect_to user_feelings_path(current_user)
  #   @feeling = current_user.feelings.find(params[:id])
  #   redirect_to user_feelings_path(current_user, @shelf, feeling_id: @feeling.id)
  # end

end
