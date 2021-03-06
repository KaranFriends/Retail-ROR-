class ApplicationController < ActionController::Base
  before_action :require_login, :current_user

  private

  def current_user
    @current_user ||= session[:current_user_id] &&
    User.find_by(id: session[:current_user_id]).id
  end

  def require_login
    unless User.find_by(id: session[:current_user_id])
      render template: "layouts/invalid"
    end
  end

end
