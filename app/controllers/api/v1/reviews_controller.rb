# app/controllers/api/v1/reviews_controller.rb

class Api::V1::ReviewsController < ApplicationController
  before_action :set_review, only: [:unsubmit, :destroy]

  # PATCH /api/v1/reviews/:id/unsubmit
  def unsubmit
    if @review.update(status: "Unsubmitted")
      render json: { message: "Review unsubmitted successfully." }, status: :ok
    else
      render json: { error: "Failed to unsubmit review" }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/reviews/:id
  def destroy
    if @review.destroy
      render json: { message: "Review deleted successfully." }, status: :ok
    else
      render json: { error: "Failed to delete review" }, status: :unprocessable_entity
    end
  end

  private

  def set_review
    @review = Review.find_by(id: params[:id])
    unless @review
      render json: { error: "Review not found" }, status: :not_found
    end
  end
end
