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

end
