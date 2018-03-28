module EventsHelper

  def rsvp_field(event, user, rsvp)
    if user.check_attendance(event) == false
      form_for [event, rsvp] do |f|
        f.hidden_field :user_id, value: user.id
         f.hidden_field :event_id, value: event.id
         f.hidden_field :age, value: user.age
         f.submit "RSVP"
      end
    else
      "delete rsvp button"
    end
  end

end
