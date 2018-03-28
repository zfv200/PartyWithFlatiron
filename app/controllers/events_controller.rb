class EventsController < ApplicationController
  before_action :require_login

  def session_variable
    @session_id = session[:user_id]
  end

  def index
    @events = Event.all
  end

  def show
    set_event
    #helper method here?
    if @event.rsvps.any? { |rsvp| rsvp.user.id == current_user.id }
      @rsvp = Rsvp.find_by(event_id: @event.id, user_id: current_user.id)
    else
      @rsvp = Rsvp.new
    end

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

  end

  private


  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :category, :max_guests, :date, :description, :location_id, :user_id)
  end

end
