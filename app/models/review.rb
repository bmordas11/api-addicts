class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :api

  validates :body, presence: true
  validates :rating, inclusion: {in: [1, 2, 3, 4, 5]}
  validates :user_id, presence: true
  validates :api_id, presence: true
end
