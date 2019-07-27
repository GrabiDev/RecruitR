class Manager < Person
    has_many :manager_interview_taggings
    before_destroy :destroy_interview_taggings

    def destroy_interview_taggings
      manager_interview_taggings.each  do |tagging|
        tagging.destroy
      end
    end
end
