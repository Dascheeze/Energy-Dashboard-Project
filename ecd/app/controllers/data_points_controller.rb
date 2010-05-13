class DataPointsController < ApplicationController
  USER_NAME, PASSWORD = "admin", "admin"
  
  before_filter :authenticate
  
  # GET /data_points
  # GET /data_points.xml
  def index
    @page_title = "Data Points"
    @data_points = DataPoint.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @data_points }
    end
  end

  # GET /data_points/1
  # GET /data_points/1.xml
  def show
    @page_title = "Data Points"
    @data_point = DataPoint.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @data_point }
    end
  end

  # GET /data_points/new
  # GET /data_points/new.xml
  def new
    @page_title = "Data Points"
    @data_point = DataPoint.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @data_point }
    end
  end

  # GET /data_points/1/edit
  def edit
    @page_title = "Data Points"
    @data_point = DataPoint.find(params[:id])
  end

  # POST /data_points
  # POST /data_points.xml
  def create
    @page_title = "Data Points"
    @data_point = DataPoint.new(params[:data_point])

    respond_to do |format|
      if @data_point.save
        flash[:notice] = 'DataPoint was successfully created.'
        format.html { redirect_to(@data_point) }
        format.xml  { render :xml => @data_point, :status => :created, :location => @data_point }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @data_point.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /data_points/1
  # PUT /data_points/1.xml
  def update
    @page_title = "Data Points"
    @data_point = DataPoint.find(params[:id])

    respond_to do |format|
      if @data_point.update_attributes(params[:data_point])
        flash[:notice] = 'DataPoint was successfully updated.'
        format.html { redirect_to(@data_point) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @data_point.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /data_points/1
  # DELETE /data_points/1.xml
  def destroy
    @page_title = "Data Points"
    @data_point = DataPoint.find(params[:id])
    @data_point.destroy

    respond_to do |format|
      format.html { redirect_to(data_points_url) }
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
