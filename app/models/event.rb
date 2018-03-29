class Event < ApplicationRecord
  has_many :rsvps
  has_many :users, through: :rsvps
  has_many :comments
  belongs_to :location
  belongs_to :user

  geocoded_by :location
  after_validation :geocode


  def lat
    location = Geocoder.search(self.location.name)
    if location
      latitude_num = location[0].latitude if location[0]
    end
  end

  def long
    location = Geocoder.search(self.location.name)
    if location
      longitude_num = location[0].longitude if location[0]
    end
  end


end
