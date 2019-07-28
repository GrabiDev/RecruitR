class Manager < Person
    has_many :manager_interview_taggings
    has_many :interviews, through: :manager_interview_taggings
    before_destroy :destroy_interview_taggings

    # ensuring managers are removed from all interviews
    # they were signed up for when manager is deleted
    def destroy_interview_taggings
      manager_interview_taggings.each  do |tagging|
        tagging.destroy
      end
    end
end
