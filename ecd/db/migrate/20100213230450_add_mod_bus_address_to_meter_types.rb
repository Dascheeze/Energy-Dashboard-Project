class AddModBusAddressToMeterTypes < ActiveRecord::Migration
  def self.up
    remove_column :meter_types, :name
    remove_column :meter_types, :Mod_Bus_Address
    rename_column :meter_types, :unit, :type
  end

  def self.down
    add_column :meter_types, :Mod_Bus_Address
    add_column :meter_types, :name
    rename_column :meter_types, :type, :unit
  end
end
