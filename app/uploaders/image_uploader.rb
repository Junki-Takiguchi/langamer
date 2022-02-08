class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  version :large do
    process resize_to_fit: [113, 100]
  end

  version :middle do
    process resize_to_fit: [57, 50]
  end

  version :small do
    process resize_to_fit: [28, 25]
  end

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    "default.png"
  end

end
