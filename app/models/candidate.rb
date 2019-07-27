class Candidate < Person
    belongs_to :position
    has_one :interview
    before_destroy :destroy_interview

    def destroy_interview
      if interview.present?
        interview.destroy
      end
    end
end
