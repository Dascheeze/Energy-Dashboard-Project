class AddPrimaryKeyToBuildingTypes < ActiveRecord::Migration
  def self.up
	  remove_column :building_types, :id
    change_column :building_types, :building_type_id, :primary_key
  end

  def self.down
    remove_column :building_types, :building_type_id
  end
end
