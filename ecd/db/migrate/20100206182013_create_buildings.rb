class CreateBuildings < ActiveRecord::Migration
  def self.up
    create_table :buildings, :primary_key => :building_id do |t|
      t.string :building_id,  :limit => 10
      t.string :building_name,  :limit => 50
      t.string :building_abbrv, :limit => 50
      t.string :building_type,  :limit => 50
      has_many :datas
      t.timestamps
    end
  end

  def self.down
    drop_table :buildings
  end
end

class CreateDatas < ActiveRecord::Migration
  def self.up
    create_table :datas, :primary_key => :data_id do |t|
      belongs_to :buildings
      t.integer :data_id
      t.integer :metertype_id
      t.string  :amount

      t.timestamps
    end
  end
  
  def self.down
    drop_table :datas
  end
end
