class ReviewsController < ApplicationController
  before_action :set_review, only: [ :show, :edit, :update, :destroy ]
  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @duck = Duck.find(params[:id])
    @review.duck = @duck
    if @review.save!
      redirect_to duck_path(@duck)
    else
      @review = Review.new
      render "ducks/show"
    end
  end

  def edit
  end

  def update
    @duck = @review.booking.duck
    if @review.update(review_params)
      redirect_to duck_path(@duck)
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    @duck = @review.booking.duck
    redirect_to duck_path(@duck)
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :stars, :id_booking)
  end
end

# @review.booking.duck
