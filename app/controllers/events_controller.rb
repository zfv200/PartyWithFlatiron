class EventsController < ApplicationController

  def index

  end

  def show
    set_event
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
