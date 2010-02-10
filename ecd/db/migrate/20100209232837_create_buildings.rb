class CreateBuildings < ActiveRecord::Migration
  def self.up
    create_table :buildings, :primary_key => :building_id do |t|
      t.integer :building_id
      t.string :building_name
      t.string :building_abbrv
      t.belongs_to :building_type
      t.timestamps
    end
  end

  def self.down
    drop_table :buildings
  end
end
