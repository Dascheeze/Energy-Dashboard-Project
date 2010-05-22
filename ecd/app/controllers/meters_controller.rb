class MetersController < ApplicationController
  USER_NAME, PASSWORD = "admin", "admin"
  
  before_filter :authenticate, :except => [ :refresh ]
  
  # GET /meters
  # GET /meters.xml
  def index
    @page_title = "Meters"
    @meters = Meter.all
    add_crumb("Admin", '/admin')
    add_crumb("Meters")
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @meters }
    end
  end

  def refresh
    @page_title = "Meters"
    Meter.all.each do |meter_num|
      parse_xml(meter_num.id)
    end
	@message = "Successfully updated all meters"
    respond_to do |format|
      format.html
    end
  end
  
  # GET /meters/1
  # GET /meters/1.xml
  def show
    @page_title = "Meters"
    @meter = Meter.find(params[:id])
    add_crumb("Admin", '/admin')
    add_crumb("Meters", '/meters')
    add_crumb(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @meter }
    end
  end

  # GET /meters/new
  # GET /meters/new.xml
  def new
    @page_title = "Meters"
    @meter = Meter.new
    @hubs = parse_device_xmls("HUB_ID")
    add_crumb("Admin", '/admin')
    add_crumb("Meters", '/meters')
    add_crumb("New")
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @meter }
    end
  end

  # GET /meters/1/edit
  def edit
    @page_title = "Meters"
    add_crumb("Admin", '/admin')
    add_crumb("Meters", '/meters')
    add_crumb("Edit")
    @meter = Meter.find(params[:id])
  end

  # POST /meters
  # POST /meters.xml
  def create
    @page_title = "Meters"
    @meter = Meter.new(params[:meter])

    respond_to do |format|
      if @meter.save
        flash[:notice] = 'Meter was successfully created.'
        format.html { redirect_to(@meter) }
        format.xml  { render :xml => @meter, :status => :created, :location => @meter }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @meter.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /meters/1
  # PUT /meters/1.xml
  def update
    @page_title = "Meters"
    @meter = Meter.find(params[:id])

    respond_to do |format|
      if @meter.update_attributes(params[:meter])
        flash[:notice] = 'Meter was successfully updated.'
        format.html { redirect_to(@meter) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @meter.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /meters/1
  # DELETE /meters/1.xml
  def destroy
    @page_title = "Meters"
    @meter = Meter.find(params[:id])
    @meter.destroy

    respond_to do |format|
      format.html { redirect_to(meters_url) }
      format.xml  { head :ok }
    end
  end
  
  require 'net/http'
  require 'rexml/document'
  include REXML

  def getURL(hub_id, command)
    @page_title = "Meters"
    
    currHub = Hub.find(hub_id.to_s)
    
    $username = currHub.login_name
    $password = currHub.login_pass
    
    # Open an HTTP connection to 
    ret = Net::HTTP.start(currHub.ip)

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
  
  def getMeterXML(hub_id, meterAddress)
    @page_title = "Meters"
    return getURL(hub_id, '/setup/devicexml.cgi?ADDRESS=' + meterAddress.to_s + '&TYPE=DATA')
  end
  
  def addDataPoint(data_set_id, value)
    @page_title = "Meters"
    newData = DataPoint.new
    newData.data_set_id = data_set_id.to_s.to_i
    newData.amount = value.to_s.to_f
    newData.save
  end
  
  def parse_xml(meter_id)
    @page_title = "Meters"
    
    meter_to_pull = Meter.find(meter_id)
    
    xml_dump = getMeterXML(meter_to_pull.hub_id, meter_to_pull.modbus_address)
    xml_doc = Document.new xml_dump
    i = 0
    while xml_doc.elements["DAS/devices/device/status"].to_s != "<status>Ok</status>"
	  logger.debug "Bad status recieved, waiting 10 seconds and retrying."
	  sleep 10
	  xml_dump = getMeterXML(meter_to_pull.hub_id, meter_to_pull.modbus_address)
	  xml_doc = Document.new xml_dump
	  if (i > 60)
		 return
	  else
		 i = i + 1
	  end
	end
	logger.debug "Good status recieved, adding to database"
    DataSet.find(:all, :conditions => { :meter_id => meter_id }).each do |series|
      xml_doc.elements.each("DAS/devices/device/records/record/point") do |ele|
        if ele.attribute("number").to_s.to_i == series.point_number
          addDataPoint(series.id, ele.attribute("value").to_s)
        end
      end
    end
	logger.debug "All datapoints added to database"
  end

  def get_meter_list(hub_id)
    @page_title = "Meters"
    return getURL(hub_id, '/setup/devlist.cgi?GATEWAY=127.0.0.1&SETUP=XML')
  end

  def parse_device_xmls(hub_id)
    xml_dump = get_meter_list(hub_id)
    xml_doc = Document.new xml_dump
    dict = {}
    xml_doc.elements.each("device") do |device|
      dict[device.attribute("address").to_s] = device.attribute("name").to_s
    end
    return dict
  end

  private
    def authenticate
      authenticate_or_request_with_http_basic do |user_name, password|
        user_name == USER_NAME && password == PASSWORD
      end
    end
end
