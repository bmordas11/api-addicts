class Api < ActiveRecord::Base
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

  def self.search(search)
    results = []
    tags = Tag.search(search)
    results += (tags.map { |tag| tag.apis })[0] unless tags.empty?
    results += where("name LIKE ?", "%#{search}%")
    results += where("description LIKE ?", "%#{search}%")
    results += where("url LIKE ?", "%#{search}%")
    results
  end
end
