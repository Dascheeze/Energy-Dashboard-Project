class RenameBuildingIdToIdInBuildings < ActiveRecord::Migration
  def self.up
	  rename_column :buildings, :building_id, :id
  end

  def self.down
  end
end
