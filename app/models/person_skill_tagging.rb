# allows for assigning multiple skills to a single person
class PersonSkillTagging < ApplicationRecord
  belongs_to :person
  belongs_to :skill
end
