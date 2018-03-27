class Event < ApplicationRecord
  has_many :rsvps
  has_many :users, through: :rsvps
  has_many :comments
  belongs_to :location
  belongs_to :user


  def check_attendance
    @user = User.find_by(@session_id)
    self.rsvps.any? do |rsvp|
      rsvp.user.username == @user.username
    end
  end

end
