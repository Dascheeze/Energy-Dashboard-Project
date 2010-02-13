class AddEnabledToBuildings < ActiveRecord::Migration
  def self.up
    add_column :buildings, :enabled, :boolean
  end

  def self.down
    remove_column :buildings, :enabled
  end
end
