module DatasHelper
	def addDataPoint(buildingId, meterId, amount, unit)
		@newData = Data.new
		@newData.building_id = buildingId
		@newData.meter_id = meterId
		@newData.amount = amount
		@newData.save
	end
end
