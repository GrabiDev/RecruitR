class Candidate < Person
    belongs_to :position
    has_one :interview
    before_destroy :destroy_interview

    # ensuring all data associated with the candidate
    # are destroyed as well
    def destroy_interview
      if interview.present?
        interview.destroy
      end
    end
end
