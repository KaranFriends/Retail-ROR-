class ApplicationController < ActionController::Base
  before_action :require_login

  private

  def current_user
    @current_user ||= session[:current_user_id] &&
    User.find_by(id: session[:current_user_id])
  end

  def require_login
    unless User.find_by(id: session[:current_user_id])
      render template: "session/invalid"
    end
  end

end
