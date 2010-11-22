module AntibodiesHelper
  def validation_images(validation)
    images = []
    validation.images.select(:id).each do |image|
      images.push(link_to("image", root_url + "validation_image/" + image.id.to_s, :target => "_blank"))
    end
    images.join("\n").html_safe
  end
end
