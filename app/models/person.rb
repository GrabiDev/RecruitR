class Person < ApplicationRecord
  has_many :person_skill_taggings
  has_many :skills, -> { distinct }, through: :person_skill_taggings

  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 2 }
  validates :email, presence: true, length: { minimum: 5 }, uniqueness: { case_sensitive: false }

  def full_name
    first_name + ' ' + last_name
  end
  
  def all_skills=(names)
    self.skills = names.split(",").map do |name|
      Skill.where(name: name.strip).first_or_create!
    end
  end
      
  def all_skills
    self.skills.map(&:name).join(", ")
  end
end
