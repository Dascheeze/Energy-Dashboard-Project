class RenameDataToDataPoint < ActiveRecord::Migration
  def self.up
    rename_table :datas, :data_points
  end

  def self.down
    rename_table :data_points, :datas
  end
end
