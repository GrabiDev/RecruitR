class CreateManagerInterviewTaggings < ActiveRecord::Migration[5.2]
  def change
    create_table :manager_interview_taggings do |t|
      t.belongs_to :interview, foreign_key: false
      t.belongs_to :manager, foreign_key: false

      t.timestamps

      add_foreign_key :interview, :manager, on_delete: :cascade
    end
  end
end
