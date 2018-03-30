class Event < ApplicationRecord
  has_many :rsvps
  has_many :users, through: :rsvps
  has_many :comments
  belongs_to :location
  belongs_to :user

  geocoded_by :location
  after_validation :geocode
  validate :address_validator


  def lat
    #if address
    if self.address
      center = Geocoder.search("#{self.address}, New York City")
      if center
        latitude_num = center[0].latitude if center[0]
      end
    else
      center = Geocoder.search(self.location.name)
      if center
        latitude_num = center[0].latitude if center[0]
      end
    end
  end

  def long
    #if address
    if self.address
      center = Geocoder.search("#{self.address}, New York City")
      if center
        longitude_num = center[0].longitude if center[0]
      end
    else
      center = Geocoder.search(self.location.name)
      if center
        longitude_num = center[0].longitude if center[0]
      end
    end
  end

  def address_validator
    if Geocoder.search("#{self.address}, New York City").empty?
      errors.add(:address, "Please enter a valid address!")
    end
  end


end
