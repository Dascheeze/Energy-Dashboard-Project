class Buildings < ActiveRecord::Base
  has_many :datas
  belongs_to :building_type
end
