class FixDatasTable < ActiveRecord::Migration
  def self.up
 #   remove_column :datas, :meter_id
#	remove_column :datas, :building_id
	add_column :datas, :series_id, :integer
  end

  def self.down
    rename_column :datas, :data_id, :id
  end
end
