class User < ActiveRecord::Base
  mount_uploader :profile_photo, ProfilePhotoUploader

  validates :first_name, presence: :true
  validates :last_name, presence: :true
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :apis, dependent: :destroy
  has_many :reviews, dependent: :destroy
end
