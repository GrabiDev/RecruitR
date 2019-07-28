# method allows for assigning multiple skills to a single position
class PositionSkillTagging < ApplicationRecord
  belongs_to :position
  belongs_to :skill
end
