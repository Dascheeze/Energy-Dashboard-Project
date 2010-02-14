class ChangeShitToId < ActiveRecord::Migration
  def self.up
	  rename_column :building_types, :building_type_id, :id
	  rename_column :datas, :data_id, :id
	  rename_column :meter_types, :meter_type_id, :id
  end

  def self.down
  end
end
