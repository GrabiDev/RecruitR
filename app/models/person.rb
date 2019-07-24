class Person < ApplicationRecord
    has_many :skill_taggings
    has_many :skills, through: :skill_taggings

    def all_skills=(names)
        self.skills = names.split(",").map do |name|
            Skill.where(name: name.strip).first_or_create!
        end
      end
      
    def all_skills
      self.skills.map(&:name).join(", ")
    end
end
