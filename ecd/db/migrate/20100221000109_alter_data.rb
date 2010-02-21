class AlterData < ActiveRecord::Migration
  def self.up
    create_table :datas do |t|
      t.belongs_to :data_set
      t.decimal :amount
    end
  end

  def self.down
  end
end
