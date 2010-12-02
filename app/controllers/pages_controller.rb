class PagesController < ApplicationController
  def home
  end

  def about
  end

  def upload
    @targets = Target.where(["targets.name like ?", "%#{params[:find_target]}%"]).includes(:species).order("targets.name") if params[:find_target].present?
    @target = Target.find(params[:target_id]) if params[:target_id].present?
    @new_target = Target.new(:name => params[:find_target]) unless params[:target_id].present? or @targets.present?
    @antibody = @target.antibodies.find(params[:antibody_id]) if params[:antibody_id].present?
    @new_antibody = @target.antibodies.new if @target.present?
    @validation = @antibody.validations.new(:target_id => @target.id, :validator_id => 1) if @antibody.present?
  end

  def create_target
    @target = Target.new(params[:target])

    respond_to do |format|
      if @target.save
        format.html { redirect_to(upload_url(:target_id => @target.id), :notice => 'Target was successfully created.') }
      else
        format.html { redirect_to(upload_url(:find_target => @target.name), :notice => "Target was not saved. Please try again.")}
      end
    end
  end

  def create_validation
    #image = Image.new
    #if params[:validation][:image].present?
    #  i = params[:validation][:image]
    #  image.filename = i.original_filename
    #  content_type = i.content_type
    #  binary_data = i.read
    #  params[:validation].delete(:image)
    #end
    @validation = Validation.new(params[:validation])
    #image.validation = @validation
    if @validation.save
      #image.save
      redirect_to(@validation.antibody, :notice => 'Validation was successfully created.')
    else
      @target = @validation.target
      @antibody = @validation.antibody
      render :action => "upload"
    end
  end
end
