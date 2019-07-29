class Skill < ApplicationRecord
    has_many :person_skill_taggings
    has_many :people, through: :person_skill_taggings
    validates :name, presence: true, uniqueness: { case_sensitive: false }
    before_validation :strip_of_whitespaces

    def strip_of_whitespaces
        self.name = name.gsub(/\s+/, "")
    end

    # ensuring assignments of people to a given skill
    # is removed upon deletion
    def destroy_skill_taggings
        people.skill_taggings.each do |tagging|
            tagging.destroy
        end
    end
end
