class ChangeDataAmountColumn < ActiveRecord::Migration
  def self.up
    change_column :datas, :amount, :decimal
  end

  def self.down
  end
end
