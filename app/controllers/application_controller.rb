class ApplicationController < ActionController::Base
  protect_from_forgery 

  def after_sign_in_path_for(user)
    if session[:target] == 'friendships'
      user_friendships_path(user)
    end
  end
end
