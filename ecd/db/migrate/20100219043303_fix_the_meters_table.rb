class FixTheMetersTable < ActiveRecord::Migration
  def self.up
    remove_column :meters, :meter_type_id_id
    remove_column :meters, :unit
  end

  def self.down
    rename_column :datas, :data_id, :id
  end
end

