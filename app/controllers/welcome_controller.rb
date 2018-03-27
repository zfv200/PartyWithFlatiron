class WelcomeController < ApplicationController
  before_action :require_login

  def home
    @user = User.find(session[:user_id])
  end

end
