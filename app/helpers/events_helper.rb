module EventsHelper

  def rsvp_field(event, user, rsvp)
    if user.check_attendance(event) == false
      render 'events/rsvp_form'
    else
      render 'events/delete_rsvp'
    end
  end

  def set_page_rsvp(event, current_user)
    if event.rsvps.any? { |rsvp| rsvp.user.id == current_user.id }
      @rsvp = Rsvp.find_by(event_id: event.id, user_id: current_user.id)
    else
      @rsvp = Rsvp.new
    end
  end

  def event_filter
    if params[:location_id]
      @events = Event.where(location_id: params[:location_id])
    elsif params[:category]
      @events = Event.where(category: params[:category])
    else
      @events = Event.all
    end
  end

  def google_map(center, latitude, longitude)
    "https://maps.googleapis.com/maps/api/staticmap?center=#{center}&size=300x300&zoom=10&markers=color:blue%7Clabel:A%7C#{latitude},#{longitude}&key=AIzaSyB3LDQK72IsKXb4kMq_osmfjKQW8tlvwIU"
  end




  #
  # def location_filter
  #   if params[:location_id]
  #     @events = Event.where(location_id: params[:location_id])
  #   else
  #     @events = Event.all
  #   end
  # end
  #
  # def category_filter
  #   if params[:category]
  #     @events = Event.where(category: params[:category])
  #   else
  #     @events = Event.all
  #   end
  # end

end
