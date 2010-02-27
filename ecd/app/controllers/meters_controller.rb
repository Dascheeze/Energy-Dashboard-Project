class MetersController < ApplicationController
  # GET /meters
  # GET /meters.xml
  def index
    @meters = Meter.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @meters }
    end
  end

  def refresh
    logger.debug "Test"
    @meters = Meter.all
    logger.debug Meter.all
    Meter.all.each do |meter_num|
      logger.debug "Test2"
      parse_xml(meter_num.modbus_address, meter_num.id)
    end
    respond_to do |format|
      format.html
    end
  end
  
  # GET /meters/1
  # GET /meters/1.xml
  def show
    @meter = Meter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @meter }
    end
  end

  # GET /meters/new
  # GET /meters/new.xml
  def new
    @meter = Meter.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @meter }
    end
  end

  # GET /meters/1/edit
  def edit
    @meter = Meter.find(params[:id])
  end

  # POST /meters
  # POST /meters.xml
  def create
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
    newData.data_set_id = data_set_id.to_s.to_i
    newData.amount = value.to_s.to_i
    newData.save
  end
  
  def parse_xml(modbus_address, meter_id)
    xml_dump = getMeterXML(modbus_address)
    xml_doc = Document.new xml_dump
    DataSet.find(:all, :conditions => { :meter_id => meter_id }).each do |series|
      xml_doc.elements.each("DAS/devices/device/records/record/point") do |ele|
        if ele.attribute("number").to_s.to_i == series.point_number
          addDataPoint(series.id, ele.attribute("value").to_s.to_i)
        end
      end
    end
  end
  
end
