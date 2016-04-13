class ReviewsController < ApplicationController
  def index
    @reviews = Reviews.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    api = Api.find(params[:api_id])
    review = Review.new(review_params)
    review.user = current_user
    review.api = api

    if review.save
      mg_client = Mailgun::Client.new(ENV['MAILGUN_API_KEY'])

      message_params = { from: 'admin@api-addicts.herokuapp.com',
        to:      review.api.user.email,
        subject: "There's a new review of your API",
        text:    "Someone reviewed your API #{}"
      }
      # if rails.env.development? || rails.env.production?

        # Send your message through the client

        mg_client.send_message(ENV['MAILGUN_DOMAIN'], message_params)
        # ReviewMailer.send_new_review_message(review)
        # ReviewMailer.new_review(review).deliver_later

      # end
      flash[:success] = 'Review Submitted!'
    else
      flash[:failure] = review.errors.full_messages.join(', ')
      flash[:failure] += '. Review Not Submitted'
    end
    redirect_to api_path(api)
  end

  private

  def review_params
    params.require(:review).permit(:body, :rating)
  end
end
