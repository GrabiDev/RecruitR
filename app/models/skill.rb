class Skill < ApplicationRecord
    has_many :skill_taggings
    has_many :people, through: :skill_taggings
end
