class DatasController < ApplicationController

  def show
	respond_to do |format|
      format.html
	end
  end

  def update
    require 'rexml/document'
    include REXML
    Meter do |meter|
	    @addr = meter.modbus_address
	    @full_addr = "http://128.193.122.20/setup/devicexml.cgi?ADDRESS=" + @addr.to_s() + "&TYPE=DATA"
	    file = File.new(full_addr)
	    doc = Document.new(file)
	    root = doc.root.DAS.devices.device.records.record
	    puts root

    end
    redirect_to(Buildings)
    respond_to do |format|
	    format.html
    end
  end
end
