class CreateDatas < ActiveRecord::Migration
  def self.up
    create_table :datas do |t|
      t.belongs_to :data_set
      t.decimal :amount

      t.timestamps
    end
  end

  def self.down
    drop_table :datas
  end
end
