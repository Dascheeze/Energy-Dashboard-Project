class DatasMeterTypetoMeterMigration < ActiveRecord::Migration
  def self.up
    rename_column :datas, :meter_type_id, :meter_id
  end

  def self.down
    rename_column :datas, :meter_id, meter_type_id
  end
end
