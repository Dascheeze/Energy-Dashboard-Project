class CreateDatas < ActiveRecord::Migration
  def self.up
    create_table :datas, :primary_key => :data_id do |t|
      t.integer :data_id
      t.belongs_to :building
      t.belongs_to :meter_type
      t.text :amount

      t.timestamps
    end
  end

  def self.down
    drop_table :datas
  end
end
