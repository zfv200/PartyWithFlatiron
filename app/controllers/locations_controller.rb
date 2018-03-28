class LocationsController < ApplicationController
  before_action :require_login

def index
  @locations = Location.all
end

def show
  @location = Location.find(params[:id])
  @event = Event.new
  @events = Event.where(location_id: @location.id)
  @user = User.find(session[:user_id])
end

end
