module MetersHelper
  
  def refresh
    Meter.all do |meter|
      parse_xml(meter.modbus_address, meter.id)
    end
  end
  require 'net/http'
  require 'rexml/document'
  include REXML

  def getURL(command)
    $username = 'admin'
    $password = 'admin'
    # Open an HTTP connection to 
    ret = Net::HTTP.start('128.193.122.20')

    # Depending on the request type, create either
    # an HTTP::Get or HTTP::Post object

    req = Net::HTTP::Get.new(command)

    # Set up the authentication and
    # make the request
    req.basic_auth( $username, $password )
    res = ret.request(req)

    # Return the request body
    return res.body
  end
  
  def getMeterXML(meterAddress)
    return getURL('/setup/devicexml.cgi?ADDRESS=' + meterAddress.to_s + '&TYPE=DATA')
  end
  
  def addDataPoint(data_set_id, value)
    newData = DataPoint.new
    newData.data_set_id = data_set_id
    newData.amount = value
	newData.save
  end
  
  def parse_xml(modbus_address, meter_id)
    xml_dump = getMeterXML(modbus_address)
    xml_doc = Document.new xml_dump
	puts "0"
    DataSet.all.each do |series|
	  puts "1"
      if series.meter_id == meter_id
		puts "2"
        xml_doc.elements.each("DAS/devices/device/records/record/point") do |ele|
		  puts "3"
          if ele.attribute("number").to_s.to_i == series.point_number
			puts "4"
            addDataPoint(series.id, ele.attribute("value").to_s.to_i)
          end
        end
      end
    end
  end
  
end
