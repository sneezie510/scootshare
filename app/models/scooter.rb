class Scooter < ApplicationRecord
  belongs_to :user
  has_many :reservations
  validates :location, presence: true
  
  geocoded_by :location
  after_validation :geocode, if: :location_changed?

  # validates :availability, inclusion: { in: [true, false] }
  mount_uploader :photo, PhotoUploader
end
