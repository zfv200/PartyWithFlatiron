class User < ApplicationRecord
  has_secure_password

  has_many :comments
  has_many :rsvps
  has_many :events, through: :rsvps
  has_many :events
  #has_many :locations, through: :events ??
end
