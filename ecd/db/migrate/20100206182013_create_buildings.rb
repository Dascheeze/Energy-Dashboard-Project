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

class CreateBuildingTypes < ActiveRecord::Migration
  def self.up
    create_table :building_types, :primary_key => :building_type_id do |t|
      t.integer :building_type_id
      t.string :name
      t.timestamps
    end
  end
  
  def self.down
    drop_table :building_types
  end
end

class CreateMeterTypes < ActiveRecord:Migration
  def self.up
    create_table :metertypes, :primary_key => :meter_type_id do |t|
      t.integer :meter_type_id
      t.string :name
      t.string :unit
    end
  end

  def self.down
    drop_table :metertypes
  end
end
