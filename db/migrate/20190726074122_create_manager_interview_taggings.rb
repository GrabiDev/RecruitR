class CreateManagerInterviewTaggings < ActiveRecord::Migration[5.2]
  def change
    create_table :manager_interview_taggings do |t|
      t.belongs_to :interview, foreign_key: { on_delete: :cascade }
      t.belongs_to :manager, foreign_key: false

      t.timestamps
    end
  end
end
