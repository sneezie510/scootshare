class Scooter < ApplicationRecord
  belongs_to :user
  has_many :reservations
  validates :location, presence: true
  validates :availability, inclusion: { in: [true, false] }

  geocoded_by :location
  after_validation :geocode, if: :location_changed?
end
