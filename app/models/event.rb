class Event < ApplicationRecord
  has_many :rsvps
  has_many :users, through: :rsvps
  has_many :comments
  belongs_to :location
  belongs_to :user

  geocoded_by :location
  after_validation :geocode


  def lat
    #if address
    location = Geocoder.search("#{self.address}, New York City")
    if location
      latitude_num = location[0].latitude if location[0]
    end
  end

  def long
    #if address
    location = Geocoder.search("#{self.address}, New York City")
    if location
      longitude_num = location[0].longitude if location[0]
    end
  end


end
