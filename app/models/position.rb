class Position < ApplicationRecord
  has_many :position_skill_taggings
  has_many :skills, through: :position_skill_taggings
  has_many :candidates
  before_destroy :destroy_candidates

  validates :title, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 20 }

  def all_skills=(names)
    self.skills = names.split(",").map do |name|
      Skill.where(name: name.strip).first_or_create!
    end
  end
      
  def all_skills
    self.skills.map(&:name).join(", ")
  end

  def destroy_candidates
    candidates.each  do |candidate|
      candidate.destroy
    end
  end
end
