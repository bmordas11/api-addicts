class Tag < ActiveRecord::Base
  validates :name, presence: true

  has_many :apitags
  has_many :apis, through: :apitags
end
