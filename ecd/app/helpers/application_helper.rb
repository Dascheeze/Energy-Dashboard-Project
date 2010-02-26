# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
    require 'net/http'


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
  
  def addDataPoint(series, value)
    newData = Data.new
    newData.series_id = series
    newData.amount = value
	newData.save
  end
  
  def parse_xml(modbus_address, meter_id)
    require 'rexml/document'
    include REXML
    xml_dump = getMeterXML(modbus_address)
    xml_doc = Document.new xml_dump

    Series.each do |series|
      if series.meter_id == meter_id
        xml_doc.elements.each("DAS/devices/device/records/record/point") do |ele|
          if ele.attribute["number"] == series.point_number
            addDataPoint(series.id, ele.attribute["value"])
          end
          puts ele.attribute["number"]
        end
      end
    end
  end
end
