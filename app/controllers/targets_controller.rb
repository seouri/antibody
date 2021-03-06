class TargetsController < ApplicationController
  autocomplete :target, :name, :full => true, :display_value => :name_with_species_and_counts
  # GET /targets
  # GET /targets.xml
  def index
    @q = params[:q] || params[:qs]
    @qs = params[:qs]
    q_search = params[:q].present? ? "%#{params[:q]}" : params[:qs]
    total_entries = Target.count if q_search.blank?
    @targets = Target.order(order_string).includes(:species, :validations, :antibodies => :source).search(q_search, :page => params[:page], :per_page => 20, :total_entries => total_entries)

    respond_to do |format|
      if params[:id].present?
        @target = Target.find(params[:id])
        format.html { redirect_to(@target) }
      else
        format.html # index.html.erb
        format.xml  { render :xml => @targets }
      end
    end
  end

  # GET /targets/1
  # GET /targets/1.xml
  def show
    @target = Target.where(:id => params[:id]).includes(:antibodies => [:host_species, {:validations => :species}]).first

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @target }
    end
  end

  # GET /targets/new
  # GET /targets/new.xml
  def new
    @target = Target.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @target }
    end
  end

  # GET /targets/1/edit
  def edit
    @target = Target.find(params[:id])
  end

  # POST /targets
  # POST /targets.xml
  def create
    @target = Target.new(params[:target])

    respond_to do |format|
      if @target.save
        format.html { redirect_to(@target, :notice => 'Target was successfully created.') }
        format.xml  { render :xml => @target, :status => :created, :location => @target }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @target.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /targets/1
  # PUT /targets/1.xml
  def update
    @target = Target.find(params[:id])

    respond_to do |format|
      if @target.update_attributes(params[:target])
        format.html { redirect_to(@target, :notice => 'Target was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @target.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /targets/1
  # DELETE /targets/1.xml
  def destroy
    @target = Target.find(params[:id])
    @target.destroy

    respond_to do |format|
      format.html { redirect_to(targets_url) }
      format.xml  { head :ok }
    end
  end

  private

  def sort_column  
    Target.column_names.include?(params[:sort]) ? params[:sort] : "name"  
  end
end
