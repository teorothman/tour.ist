class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to my_tours_path, notice: "Your review was created!"
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.permit(:content, :rating, :booking_id)
  end
end
