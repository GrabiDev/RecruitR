class Interview < ApplicationRecord
  belongs_to :candidate
  has_many :manager_interview_taggings
  has_many :managers, through: :manager_interview_taggings

  validates :candidate, uniqueness: true
  validates :location, length: { minimum: 2 }
  validate :start_datetime_cannot_be_in_the_past
  validate :end_datetime_must_be_after_start_datetime
  validate :location_available
  validate :must_start_and_end_on_the_same_day

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

  def must_start_and_end_on_the_same_day
    if start_datetime.present? && end_datetime.present? && start_datetime.to_date != end_datetime.to_date
      errors.add(:interview, "must start and end on the same day")
    end
  end

  def location_available
    overlapping_interviews = Interview.where(["((start_datetime >= :start_dt and start_datetime < :end_dt) or end_datetime <= :end_dt) and location = :location and not id = :id", {start_dt: start_datetime, end_dt: end_datetime, location: location, id: id}])

    if overlapping_interviews.present?
      errors.add(:location, "is already booked during this time")
    end
  end
end
