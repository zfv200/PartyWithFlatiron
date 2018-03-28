module EventsHelper

  def rsvp_field(event, user, rsvp)
    if user.check_attendance(event) == false
      render 'events/rsvp_form'
    else
      render 'events/delete_rsvp'
    end
  end

end
