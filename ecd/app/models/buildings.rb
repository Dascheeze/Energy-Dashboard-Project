class Buildings < ActiveRecord::Base
  has_many :datas
  has_many :meters
  belongs_to :building_type
end
