class Position < ApplicationRecord
  has_many :position_skill_taggings
  has_many :skills, -> { distinct }, through: :position_skill_taggings
  has_many :candidates
  before_destroy :destroy_candidates

  validates :title, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 20 }

  # for following two methods, code taken from:
  # https://www.sitepoint.com/tagging-scratch-rails/

  # method allowing for adding skills after a comma
  def all_skills=(names)
    self.skills = names.split(",").map do |name|
      Skill.where(name: name.strip).first_or_create!
    end
  end
  
  # method for displaying skills as comma separated
  # parameters for displaying them in edit view
  def all_skills
    self.skills.map(&:name).join(", ")
  end

  # ensuring candidates assigned to the position are also removed
  def destroy_candidates
    candidates.each  do |candidate|
      candidate.destroy
    end
  end
end
