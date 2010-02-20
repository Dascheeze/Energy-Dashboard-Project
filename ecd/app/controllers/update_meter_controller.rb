class UpdateMeterController < ApplicationController
  def index
    @meters = Meter.all
	all_meters = @meters
	all_meters do |meter|
	  parse_xml meter.modbus_address meter.id
	end
	respond_to do |format|
		format.html
	end
  end
end
