class Location < ApplicationRecord

  validates :country, :city, :area, :street, :building_number, :full_address, presence: true

  after_create_commit lambda {
    broadcast_prepend_to "locations_list", target: "locations"
  }

end
