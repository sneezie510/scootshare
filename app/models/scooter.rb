class Scooter < ApplicationRecord
  belongs_to :user
  has_many :reservations
  validates :location, presence: true
  # validates :availability, inclusion: { in: [true, false] }
  mount_uploader :photo, PhotoUploader
end
