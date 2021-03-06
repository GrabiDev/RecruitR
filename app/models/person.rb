class Person < ApplicationRecord
  has_many :person_skill_taggings
  # distinct guarantees same skill not assigned multiple times
  # to the same person
  has_many :skills, -> { distinct }, through: :person_skill_taggings

  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 2 }
  validates :email, presence: true, length: { minimum: 5 }, uniqueness: { case_sensitive: false }
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

  # method to compile full name for easier display purposes
  def full_name
    first_name + ' ' + last_name
  end

  # method to compile full name with the list of skills
  def full_name_with_skills
    self.full_name + ' ' + self.all_skills_with_hashtags
  end

  # method to compile skills with hashtags for visual purposes
  def all_skills_with_hashtags
    self.skills.map(&:name).collect{|name| '#' + name}.join(' ')
  end
  
  # for following two methods, code taken from:
  # https://www.sitepoint.com/tagging-scratch-rails/

  # method allowing for adding skills after a comma
  def all_skills=(names)
    self.skills = names.split(',').map do |name|
      Skill.where(name: name.strip).first_or_create!
    end
  end
  
  # method for displaying skills as comma separated
  # parameters for displaying them in edit view
  def all_skills
    self.skills.map(&:name).join(', ')
  end

  def all_skills_for_db
    self.skills.map(&:name).collect{|name| '\'' + name + '\''}.join(', ')
  end
end
