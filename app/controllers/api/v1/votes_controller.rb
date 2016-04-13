module Api::V1
  class VotesController < ApiController
    before_filter :authenticate_user!

    def upvote
      user = current_user.id
      found_vote = Votes.find_by(user: user, api: params[:api_id])

      if found_vote == nil
        create_vote(params[:api_id], user, true)
        render json: Votes.calculate_votes(params[:api_id])
        return
      else
        flip_vote(found_vote)
        render json: Votes.calculate_votes(params[:api_id])
      end
    end

    def downvote
      user = current_user.id
      found_vote = Votes.find_by(user: user, api: params[:api_id])

      if found_vote == nil
        create_vote(params[:api_id], user, false)
        render json: Votes.calculate_votes(params[:api_id])
        return
      else
        flip_vote(found_vote)
        render json: Votes.calculate_votes(params[:api_id])
      end
    end

    def create_vote(api_id, user_id, vote_bool)
      Votes.create(
        user: User.find(user_id),
        api: Api.find(api_id),
        user_vote: vote_bool)
    end

    def flip_vote(vote)
      if vote.user_vote
        vote.user_vote = false
      else
        vote.user_vote = true
      end
      vote.save
    end

    private

    def current_user
      warden.user
    end

    def warden
      env['warden']
    end
  end
end
