class DashboardsController < ApplicationController

  def index
    if(validate != true)
      render plain:"You have been logged out"

  end

  def validate
    if session[:current_user_id]?
      return "true"
    else
      return "false"
    end
  end
end
