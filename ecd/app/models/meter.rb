class Meter < ActiveRecord::Base
  belongs_to :building
  belongs_to :hub
end
