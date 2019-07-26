class CreateInterviews < ActiveRecord::Migration[5.2]
  def change
    create_table :interviews do |t|
      t.belongs_to :candidate, foreign_key: false
      t.string :location
      t.datetime :start_datetime
      t.datetime :end_datetime

      t.timestamps
    end
  end
end
