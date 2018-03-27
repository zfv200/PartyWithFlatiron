class Event < ApplicationRecord
  has_many :rsvps
  has_many :users, through: :rsvps
  has_many :comments
  belongs_to :location
  belongs_to :user


  def check_attendance
    #way to check attendance
    true
  end

end
