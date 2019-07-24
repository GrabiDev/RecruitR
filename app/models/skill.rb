class Skill < ApplicationRecord
    has_many :skill_taggings
    has_many :people, through: :skill_taggings
    validates :skill_name, presence: true, uniqueness: { case_sensitive: false }
end
