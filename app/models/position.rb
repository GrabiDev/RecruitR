class Position < ApplicationRecord
  has_many :position_skill_taggings
  has_many :skills, through: :position_skill_taggings

  validates :title, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 20 }
end
