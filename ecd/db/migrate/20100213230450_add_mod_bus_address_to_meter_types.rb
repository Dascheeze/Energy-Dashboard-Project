class AddModBusAddressToMeterTypes < ActiveRecord::Migration
  def self.up
    add_column :meter_types, :Mod_Bus_Address, :integer
  end

  def self.down
    remove_column :meter_types, :Mod_Bus_Address
  end
end
