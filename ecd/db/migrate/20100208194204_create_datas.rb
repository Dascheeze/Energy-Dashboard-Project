class CreateDatas < ActiveRecord::Migration
  def self.up
    create_table :datas, :primary_key => :data_id do |t|
      t.integer :data_id
      t.string :amount
      t.belongs_to :meter_types
      t.timestamps
    end
  end

  def self.down
    drop_table :datas
  end
end
