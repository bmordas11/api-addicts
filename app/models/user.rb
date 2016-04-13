class User < ActiveRecord::Base
  validates :first_name, presence: :true
  validates :last_name, presence: :true
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :apis, dependent: :destroy
  has_many :reviews, dependent: :destroy

  def name
    "#{self.first_name} #{self.last_name}"
  end
end
