class EventsController < ApplicationController
  before_action :require_login
  include EventsHelper

  def session_variable
    @session_id = session[:user_id]
  end

  def index
    event_filter
  end

  def show
    set_event
    set_page_rsvp(@event, current_user)
    set_center(@event)
    @rsvps = Rsvp.where(event_id: @event.id)
    @comment = Comment.new
    @user = User.find(session[:user_id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to home_path
    else
      render :new
    end
  end

  def destroy
    set_event
    @event.rsvps.destroy_all
    @event.destroy
    redirect_to home_path
  end

  private


  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :category, :max_guests, :date, :description, :location_id, :user_id, :address)
  end

end
