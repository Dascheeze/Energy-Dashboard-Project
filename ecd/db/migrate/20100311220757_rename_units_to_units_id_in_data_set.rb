class RenameUnitsToUnitsIdInDataSet < ActiveRecord::Migration
  def self.up
    rename_column :data_sets, :units, :power_unit_id
  end

  def self.down
    rename_column :data_sets, :power_unit_id, :units
  end
end
