class ApplicationController < ActionController::Base
  before_action :require_login

  # Finds the User with the ID stored in the session with the key
  # :current_user_id This is a common way to handle user login in
  # a Rails application; logging in sets the session value and
  # logging out removes it.
  private

  # def current_user
  #   @_current_user ||= session[:current_user_id] &&
  #   User.find_by(id: session[:current_user_id])
  # end

  def require_login
    unless User.find_by(id: session[:current_user_id])
      render template: "sessions/invalid" # halts request cycle
    end
  end

end
