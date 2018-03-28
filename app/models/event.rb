class Event < ApplicationRecord
  has_many :rsvps
  has_many :users, through: :rsvps
  has_many :comments
  belongs_to :location
  belongs_to :user

  geocoded_by :location
  after_validation :geocode


  def latitude
    location = Geocoder.search(self.location.name)
    latitude = location[0].latitude if location
  end

  def longitude
    location = Geocoder.search(self.location.name)
    longitude = location[0].longitude if location
  end


end
