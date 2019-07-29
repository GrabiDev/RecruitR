class Interview < ApplicationRecord
  belongs_to :candidate
  has_many :manager_interview_taggings
  has_many :managers, through: :manager_interview_taggings

  before_validation :convert_location_to_lowercase
  validates :candidate, uniqueness: true
  validates :managers, presence: true
  validate :start_datetime_cannot_be_in_the_past
  validate :end_datetime_must_be_after_start_datetime
  validate :location_available
  validate :must_start_and_end_on_the_same_day
  validate :managers_available

  # convert location to trimmed lowercase
  def convert_location_to_lowercase
    if self.location.present?
      self.location = location.downcase.gsub(/\s+/, "")
    end
  end

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

  def managers_available
    managers.each do |manager|
      manager.interviews.each do |interview|
        if ((interview.start_datetime >= start_datetime and interview.start_datetime <= end_datetime) or end_datetime <= interview.end_datetime) and interview.id != id
          errors.add(:manager, manager.full_name + " has other interview planned between " + interview.start_datetime.to_s(:time) + " and " + interview.end_datetime.to_s(:time))
        end
      end
    end
  end

  def must_start_and_end_on_the_same_day
    if start_datetime.present? && end_datetime.present? && start_datetime.to_date != end_datetime.to_date
      errors.add(:interview, "must start and end on the same day")
    end
  end

  def location_available
    overlapping_interviews = Interview.where(["((start_datetime >= :start_dt and start_datetime < :end_dt) or end_datetime <= :end_dt) and location like :location and not id = :id", {start_dt: start_datetime, end_dt: end_datetime, location: location, id: id}])

    if overlapping_interviews.present?
      errors.add(:location, "is already booked during this time")
    end
  end
end
