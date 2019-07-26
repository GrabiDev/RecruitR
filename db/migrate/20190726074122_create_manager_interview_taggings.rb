class CreateManagerInterviewTaggings < ActiveRecord::Migration[5.2]
  def change
    create_table :manager_interview_taggings do |t|
      t.belongs_to :interview, foreign_key: true
      t.belongs_to :manager, foreign_key: true

      t.timestamps
    end
  end
end
