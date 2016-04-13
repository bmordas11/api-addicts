class VotesController < ApplicationController
  def upvote
    found = Votes.find_by(user: params[:user], api: params[:api_id])

    if found == nil
      Votes.create(
        user: User.find(params[:user]),
        api: Api.find(params[:api_id]),
        user_vote: true)
      render json: Votes.calculate_votes(params[:api_id])
      return
    end
    if found.user_vote == false
      found.user_vote = true
      found.save
      render json: Votes.calculate_votes(params[:api_id])
      return
    end
    render json: Votes.calculate_votes(params[:api_id])
  end

  def downvote
    found = Votes.find_by(user: params[:user], api: params[:api_id])

    if found == nil
      Votes.create(
        user: User.find(params[:user]),
        api: Api.find(params[:api_id]),
        user_vote: false)
      render json: Votes.calculate_votes(params[:api_id])
      return
    end
    if found.user_vote == true
      found.user_vote = false
      found.save
      render json: Votes.calculate_votes(params[:api_id])
      return
    end
    render json: Votes.calculate_votes(params[:api_id])
  end
end
