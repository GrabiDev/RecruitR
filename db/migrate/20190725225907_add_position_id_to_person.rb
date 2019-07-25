class AddPositionIdToPerson < ActiveRecord::Migration[5.2]
  def change
    add_column :people, :position_id, :integer
  end
end
