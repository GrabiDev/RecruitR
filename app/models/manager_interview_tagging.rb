# allows for assigning multiple managers to a single interview
class ManagerInterviewTagging < ApplicationRecord
  belongs_to :interview
  belongs_to :manager
end
