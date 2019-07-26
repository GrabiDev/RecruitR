class Candidate < Person
    belongs_to :position
    has_one :interview
end
