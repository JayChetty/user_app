class ApplicationController < ActionController::Base
  protect_from_forgery 

  def after_sign_in_path_for(user)
    if session[:target] == 'friendships'
      user_friendships_path(user)
    elsif session[:target] == 'cards'
      user_cards_path(user)
    else 
      user_path(user)
    end
  end
end
