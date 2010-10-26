class ValidatorsController < ApplicationController
  # GET /validators
  # GET /validators.xml
  def index
    @validators = Validator.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @validators }
    end
  end

  # GET /validators/1
  # GET /validators/1.xml
  def show
    @validator = Validator.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @validator }
    end
  end

  # GET /validators/new
  # GET /validators/new.xml
  def new
    @validator = Validator.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @validator }
    end
  end

  # GET /validators/1/edit
  def edit
    @validator = Validator.find(params[:id])
  end

  # POST /validators
  # POST /validators.xml
  def create
    @validator = Validator.new(params[:validator])

    respond_to do |format|
      if @validator.save
        format.html { redirect_to(@validator, :notice => 'Validator was successfully created.') }
        format.xml  { render :xml => @validator, :status => :created, :location => @validator }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @validator.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /validators/1
  # PUT /validators/1.xml
  def update
    @validator = Validator.find(params[:id])

    respond_to do |format|
      if @validator.update_attributes(params[:validator])
        format.html { redirect_to(@validator, :notice => 'Validator was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @validator.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /validators/1
  # DELETE /validators/1.xml
  def destroy
    @validator = Validator.find(params[:id])
    @validator.destroy

    respond_to do |format|
      format.html { redirect_to(validators_url) }
      format.xml  { head :ok }
    end
  end
end
