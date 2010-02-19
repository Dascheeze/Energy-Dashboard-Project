class FixDatasTable < ActiveRecord::Migration
  def self.up
    remove_column :datas, :meter_type_id_id
	remove_column :datas, :building_id_id
	rename_column :datas, :id, :data_id
	add_column :datas, :series_id, integer
  end

  def self.down
    rename_column :datas, :data_id, :id
  end
end
