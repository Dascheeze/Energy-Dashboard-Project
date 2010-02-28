class AddNameToMeters < ActiveRecord::Migration
  def self.up
    add_column :meters, :name, :string
  end

  def self.down
    remove_column :meters, :name
  end
end
