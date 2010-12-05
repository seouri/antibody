module AntibodiesHelper
  def validation_images(validation)
    link_to("open", validation.image.url, :target => "_blank", :class => "validation_image") if validation.image_file_name.present?
  end
end
