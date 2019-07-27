class Skill < ApplicationRecord
    has_many :person_skill_taggings
    has_many :people, through: :person_skill_taggings
    validates :name, presence: true, uniqueness: { case_sensitive: false }

    def destroy_skill_taggings
        people.skill_taggings.each do |tagging|
            tagging.destroy
        end
    end
end
