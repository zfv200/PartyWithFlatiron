class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :require_login

  def current_user
    @user = User.find_by(id: session[:user_id])
  end

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end

end
