class RsvpsController < ApplicationController

  def create
    @rsvp = Rsvp.new(rsvp_params)

    if @rsvp.save
      redirect_to event_path(@rsvp.event)
    else
      redirect_to event_path(@rsvp.event), :flash => {:error => "You've already RSVP'd!"}
      #flasherror
    end
  end

  def destroy
    
  end


  private

  def rsvp_params
    params.require(:rsvp).permit(:user_id, :event_id, :age)
  end

end
