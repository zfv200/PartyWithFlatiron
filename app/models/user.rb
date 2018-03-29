class User < ApplicationRecord
  has_secure_password

  has_many :comments
  has_many :rsvps
  has_many :events, through: :rsvps
  has_many :events
  #has_many :locations, through: :events ??

  def check_attendance(event)
    event.rsvps.any? do |rsvp|
      rsvp.user.id == self.id
    end
  end

  def next_event
    rsvp = self.rsvps.sort_by { |rsvp| rsvp.event.date.to_i - DateTime.now.to_i }.first
    rsvp.event.title
  end

  def suggested_events
    array = self.rsvps.collect { |rsvp| rsvp.event.rsvps }
    users_array = array.collect {|rsvp_collection| rsvp_collection.collect { |rsvp| rsvp.user }}
    users = users_array.collect { |event_users| event_users.collect { |user| user.username }}.flatten.uniq
    objects = users.collect { |user| User.find_by(username: user) }
    events = objects.collect { |user| user.rsvps.collect { |rsvp_array| rsvp_array.event.title } }.flatten.uniq
    self_events = self.rsvps.collect { |rsvp| rsvp.event.title }
    my_events = self.events.collect {|event| event.title}
    suggests = events.select { |event| !self_events.include?(event) && !my_events.include?(event) }
    suggested = suggests.collect { |event| Event.find_by(title: event)}
  end

end
