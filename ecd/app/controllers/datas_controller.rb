class DatasController < ApplicationController
  # GET /datas
  # GET /datas.xml
  def index
    @datas = Data.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @datas }
    end
  end

  # GET /datas/1
  # GET /datas/1.xml
  def show
    @data = Data.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @data }
    end
  end

  # GET /datas/new
  # GET /datas/new.xml
  def new
    @data = Data.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @data }
    end
  end

  # GET /datas/1/edit
  def edit
    @data = Data.find(params[:id])
  end

  # POST /datas
  # POST /datas.xml
  def create
    @data = Data.new(params[:data])

    respond_to do |format|
      if @data.save
        flash[:notice] = 'Data was successfully created.'
        format.html { redirect_to(@data) }
        format.xml  { render :xml => @data, :status => :created, :location => @data }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /datas/1
  # PUT /datas/1.xml
  def update
    @data = Data.find(params[:id])

    respond_to do |format|
      if @data.update_attributes(params[:data])
        flash[:notice] = 'Data was successfully updated.'
        format.html { redirect_to(@data) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /datas/1
  # DELETE /datas/1.xml
  def destroy
    @data = Data.find(params[:id])
    @data.destroy

    respond_to do |format|
      format.html { redirect_to(datas_url) }
      format.xml  { head :ok }
    end
  end
end
