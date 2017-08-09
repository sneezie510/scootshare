class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :scooter
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_must_be_after_start

  private

  def end_must_be_after_start
    if start_date > end_date
      errors.add(:end_date, "must be after the start date")
    end
  end
end
