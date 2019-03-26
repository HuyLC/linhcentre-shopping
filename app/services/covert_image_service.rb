# frozen_string_literal: true

class ConvertImage
  def initialize(image_data)
    @image_data = image_data
  end

  def covert
    temp_img_file = @image_data.tempfile
    img_params = { filename: "#{name}#{File.extname(temp_img_file)}",
                   type: image_data.content_type,
                   tempfile: temp_img_file }
    ActionDispatch::Http::UploadedFile.new(img_params)
  end
end
