class Interview < ApplicationRecord
  belongs_to :candidate
  has_many :manager_interview_taggings
  has_many :managers, through: :manager_interview_taggings

  validates :location, presence: true, length: { minimum: 2 }
  validates :start_datetime, presence: true
  validates :end_datetime, presence: true
  validate :start_datetime_cannot_be_in_the_past
  validate :end_datetime_must_be_after_start_datetime
  validate :location_available

  def start_datetime_cannot_be_in_the_past
    if start_datetime.present? && start_datetime.past?
      errors.add(:start_datetime, "can't be in the past")
    end
  end

  def end_datetime_must_be_after_start_datetime
    if end_datetime.present? && start_datetime.present? && end_datetime < start_datetime
      errors.add(:end_datetime, "must be after start datetime")
    end
  end

  def location_available
    overlapping_interviews = Interview.where(["(start_datetime >= :start_dt and start_datetime <= :start_dt) or (end_datetime >= :end_dt and end_datetime <= :end_dt) and location = :location", {start_dt: start_datetime, end_dt: end_datetime, location: location}])

    if overlapping_interviews.present?
      errors.add(:location, "is already booked during this time")
    end
  end
end
