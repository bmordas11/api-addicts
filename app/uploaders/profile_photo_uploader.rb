class ProfilePhotoUploader < CarrierWave::Uploader::Base
  if Rails.env.test?
    storage :file
  else
    storage :fog
  end

  def store_dir
    "public/photo_uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end
