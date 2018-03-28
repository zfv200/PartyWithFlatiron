class RsvpsController < ApplicationController

  def create
    @rsvp = Rsvp.new(rsvp_params)

    if @rsvp.save
      redirect_to event_path(@rsvp.event)
    else
      redirect_to event_path(@rsvp.event), :flash => {:error => "You've already RSVP'd!"}
    end
  end

  def destroy
    @rsvp = Rsvp.find_by(event_id: 1, user_id: 1)
    event_id = @rsvp.event.id
    @rsvp.destroy
    redirect_to event_path(event_id)
  end


  private

  def rsvp_params
    params.require(:rsvp).permit(:user_id, :event_id, :age)
  end

end
