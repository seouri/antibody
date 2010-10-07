class AntibodiesController < ApplicationController
  # GET /antibodies
  # GET /antibodies.xml
  def index
    @antibodies = Antibody.includes(:target => :species).paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @antibodies }
    end
  end

  # GET /antibodies/1
  # GET /antibodies/1.xml
  def show
    @antibody = Antibody.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @antibody }
    end
  end

  # GET /antibodies/new
  # GET /antibodies/new.xml
  def new
    @antibody = Antibody.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @antibody }
    end
  end

  # GET /antibodies/1/edit
  def edit
    @antibody = Antibody.find(params[:id])
  end

  # POST /antibodies
  # POST /antibodies.xml
  def create
    @antibody = Antibody.new(params[:antibody])

    respond_to do |format|
      if @antibody.save
        format.html { redirect_to(@antibody, :notice => 'Antibody was successfully created.') }
        format.xml  { render :xml => @antibody, :status => :created, :location => @antibody }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @antibody.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /antibodies/1
  # PUT /antibodies/1.xml
  def update
    @antibody = Antibody.find(params[:id])

    respond_to do |format|
      if @antibody.update_attributes(params[:antibody])
        format.html { redirect_to(@antibody, :notice => 'Antibody was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @antibody.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /antibodies/1
  # DELETE /antibodies/1.xml
  def destroy
    @antibody = Antibody.find(params[:id])
    @antibody.destroy

    respond_to do |format|
      format.html { redirect_to(antibodies_url) }
      format.xml  { head :ok }
    end
  end
end
