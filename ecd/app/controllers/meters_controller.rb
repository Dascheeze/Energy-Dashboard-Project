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
#    Meter.all do |meter|
#      parse_xml(meter.modbus_address, meter.id)
#    end
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
  
  
end
