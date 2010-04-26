class DataSetsController < ApplicationController
  USER_NAME, PASSWORD = "admin", "admin"
  
  before_filter :authenticate, :except => [ :get_table ]
  
  include ApplicationHelper
  # GET /data_sets
  # GET /data_sets.xml
  def index
    @data_sets = DataSet.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @data_sets }
    end
  end
  
  def get_table
    if params[:id]
      @data_set_id = params[:id]
    else
      @data_set_id = 1
    end
    
    logger.debug params
    
    if params[:dateform] and params[:dateform][:start_date]
	    @start_time = Time.parse(params[:dateform][:start_date]).midnight.localtime
    else
      @start_time = Time.now.midnight.localtime
    end
      
    endTime = @start_time + 1.day
    
    logger.debug @data_set_id
    
	  p = points_between_dates(@data_set_id, @start_time, endTime) 
	  @item_data = real_diff(p)
    @item_bounds =  get_bounds( @item_data)
	  
	  @data_set = DataSet.find(@data_set_id)
    
	  @assoc_meter = Meter.find(:first, @data_set.meter_id)
    #@data_points = DataPoint.find(:all, :conditions => { :data_set_id => params[:id] })
	  
	  respond_to do |format|
		  format.html
	  end
	  
  end
  
  
  
  # GET /data_sets/1
  # GET /data_sets/1.xml
  def show
    @data_set = DataSet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @data_set }
    end
  end

  # GET /data_sets/new
  # GET /data_sets/new.xml
  def new
    @data_set = DataSet.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @data_set }
    end
  end

  # GET /data_sets/1/edit
  def edit
    @data_set = DataSet.find(params[:id])
  end

  # POST /data_sets
  # POST /data_sets.xml
  def create
    @data_set = DataSet.new(params[:data_set])

    respond_to do |format|
      if @data_set.save
        flash[:notice] = 'DataSet was successfully created.'
        format.html { redirect_to(@data_set) }
        format.xml  { render :xml => @data_set, :status => :created, :location => @data_set }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @data_set.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /data_sets/1
  # PUT /data_sets/1.xml
  def update
    @data_set = DataSet.find(params[:id])

    respond_to do |format|
      if @data_set.update_attributes(params[:data_set])
        flash[:notice] = 'DataSet was successfully updated.'
        format.html { redirect_to(@data_set) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @data_set.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /data_sets/1
  # DELETE /data_sets/1.xml
  def destroy
    @data_set = DataSet.find(params[:id])
    @data_set.destroy

    respond_to do |format|
      format.html { redirect_to(data_sets_url) }
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
