class Votes < ActiveRecord::Base
  belongs_to :api
  belongs_to :user

  def self.calculate_votes(api_id)
    @api = Api.find(api_id)
    @upvotes = Votes.where(user_vote: true, api: @api).count
    @downvotes = Votes.where(user_vote: false, api: @api).count
    { upvotes: @upvotes, downvotes: @downvotes }
  end
end
