# Load the Rails application.
require_relative 'application'
require 'geocoder'
require "geocoder/railtie"
Geocoder::Railtie.insert

# Initialize the Rails application.
Rails.application.initialize!
