class CreatePositionSkillTaggings < ActiveRecord::Migration[5.2]
  def change
    create_table :position_skill_taggings do |t|
      t.belongs_to :position, foreign_key: true
      t.belongs_to :skill, foreign_key: true

      t.timestamps
    end
  end
end
