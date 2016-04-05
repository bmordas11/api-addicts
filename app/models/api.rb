class Api < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :url, presence: true, uniqueness: true
  validates :description, presence: true
end
