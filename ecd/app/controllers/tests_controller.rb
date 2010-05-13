class TestsController < ApplicationController
  # GET /tests
  # GET /tests.xml
  def index
    @page_title = "Tests"
    @tests = Test.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tests }
    end
  end

  def new_table
    @page_title = "Tests"
    respond_to do |format|
      format.html
    end
  end

  # GET /tests/1
  # GET /tests/1.xml
  def show
    @page_title = "Tests"
    @test = Test.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @test }
    end
  end

  # GET /tests/new
  # GET /tests/new.xml
  def new
    @page_title = "Tests"
    @test = Test.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @test }
    end
  end

  # GET /tests/1/edit
  def edit
    @page_title = "Tests"
    @test = Test.find(params[:id])
  end

  # POST /tests
  # POST /tests.xml
  def create
    @page_title = "Tests"
    @test = Test.new(params[:test])

    respond_to do |format|
      if @test.save
        flash[:notice] = 'Test was successfully created.'
        format.html { redirect_to(@test) }
        format.xml  { render :xml => @test, :status => :created, :location => @test }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @test.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tests/1
  # PUT /tests/1.xml
  def update
    @page_title = "Tests"
    @test = Test.find(params[:id])

    respond_to do |format|
      if @test.update_attributes(params[:test])
        flash[:notice] = 'Test was successfully updated.'
        format.html { redirect_to(@test) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @test.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tests/1
  # DELETE /tests/1.xml
  def destroy
    @page_title = "Tests"
    @test = Test.find(params[:id])
    @test.destroy

    respond_to do |format|
      format.html { redirect_to(tests_url) }
      format.xml  { head :ok }
    end
  end
end
