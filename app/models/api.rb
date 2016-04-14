class Api < ActiveRecord::Base

  CATEGORIES = [
    'News',
    'Sports',
    'Search',
    'Events',
    'Food',
    'Music',
    'Geolocation',
    'Social Networking'
  ]

  validates :name, presence: true
  validates :url, presence: true
  validates :name, uniqueness: { scope: :url }
  validates :description, presence: true

  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :api_tags
  has_many :tags, through: :api_tags

  def self.add_tags(api, tags)
    tags.each do |tag|
      new_tag = Tag.new(name: "#{tag}")
      new_tag.save
      new_join = ApiTag.new(api: api, tag: new_tag)
      new_join.save
    end
  end
end
