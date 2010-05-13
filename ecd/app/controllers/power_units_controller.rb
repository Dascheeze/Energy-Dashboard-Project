class PowerUnitsController < ApplicationController
  USER_NAME, PASSWORD = "admin", "admin"
  
  before_filter :authenticate
  
  # GET /power_units
  # GET /power_units.xml
  def index
    @page_title = "Power Units"
    @power_units = PowerUnit.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @power_units }
    end
  end

  # GET /power_units/1
  # GET /power_units/1.xml
  def show
    @power_unit = PowerUnit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @power_unit }
    end
  end

  # GET /power_units/new
  # GET /power_units/new.xml
  def new
    @power_unit = PowerUnit.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @power_unit }
    end
  end

  # GET /power_units/1/edit
  def edit
    @power_unit = PowerUnit.find(params[:id])
  end

  # POST /power_units
  # POST /power_units.xml
  def create
    @power_unit = PowerUnit.new(params[:power_unit])

    respond_to do |format|
      if @power_unit.save
        flash[:notice] = 'PowerUnit was successfully created.'
        format.html { redirect_to(@power_unit) }
        format.xml  { render :xml => @power_unit, :status => :created, :location => @power_unit }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @power_unit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /power_units/1
  # PUT /power_units/1.xml
  def update
    @power_unit = PowerUnit.find(params[:id])

    respond_to do |format|
      if @power_unit.update_attributes(params[:power_unit])
        flash[:notice] = 'PowerUnit was successfully updated.'
        format.html { redirect_to(@power_unit) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @power_unit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /power_units/1
  # DELETE /power_units/1.xml
  def destroy
    @power_unit = PowerUnit.find(params[:id])
    @power_unit.destroy

    respond_to do |format|
      format.html { redirect_to(power_units_url) }
      format.xml  { head :ok }
    end
  end
  private
    def authenticate
      authenticate_or_request_with_http_basic do |user_name, password|
        user_name == USER_NAME && password == PASSWORD
      end
    end
end
