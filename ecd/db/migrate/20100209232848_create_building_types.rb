class CreateBuildingTypes < ActiveRecord::Migration
  def self.up
    create_table :building_types do |t|
      t.integer :building_type_id
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :building_types
  end
end
