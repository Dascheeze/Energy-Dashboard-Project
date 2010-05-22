class CreateHubs < ActiveRecord::Migration
  def self.up
    create_table :hubs do |t|
      t.string :name
      t.string :ip
      t.int :building_id

      t.timestamps
    end
  end

  def self.down
    drop_table :hubs
  end
end
