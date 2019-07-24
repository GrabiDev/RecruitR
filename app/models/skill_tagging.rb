class SkillTagging < ApplicationRecord
  belongs_to :skill
  belongs_to :person
end
