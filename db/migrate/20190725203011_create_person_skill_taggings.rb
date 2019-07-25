class CreatePersonSkillTaggings < ActiveRecord::Migration[5.2]
  def change
    create_table :person_skill_taggings do |t|
      t.belongs_to :person, foreign_key: true
      t.belongs_to :skill, foreign_key: true

      t.timestamps
    end
  end
end
