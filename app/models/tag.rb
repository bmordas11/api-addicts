class Tag < ActiveRecord::Base
  validates :name, presence: true

  has_many :api_tags
  has_many :apis, through: :api_tags

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end
end
