class ChangeBuildingIdIdToBuildingIdInMeters < ActiveRecord::Migration
  def self.up
    rename_column :meters, :building_id_id, :building_id
  end

  def self.down
    rename_column :meters, :building_id, :building_id_id
  end
end
