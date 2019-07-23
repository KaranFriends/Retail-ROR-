class DashboardsController < ApplicationController

  def index
    # if(validate != true)
    #   render plain:"You have been logged out"

  end

  def validate
  #   if session[:current_user_id]?
  #     return "true"
  #   else
  #     return "false"
  #   end
  end


  private
  # Finds the User with the ID stored in the session with the key
  # :current_user_id This is a common way to handle user login in
  # a Rails application; logging in sets the session value and
  # logging out removes it.
  def current_user
    @_current_user ||= session[:current_user_id] &&
      User.find_by(id: session[:current_user_id])
  end
end
