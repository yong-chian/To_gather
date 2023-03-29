class HostReviewsController < ApplicationController
  before_action :set_booking
  before_action :set_host_review, only: [show, :edit, :update, :destroy]

  def index
    @host_reviews = @booking.host_reviews
  end

  def new
    @host_review = HostReview.new
  end

  def create
    @host_review = HostReview.new(host_review_params)
    @host_review.booking = @booking

    if @host_review.save
      redirect_to @booking, notice: 'Host review was successfully created.'
    else
      render :new
    end
  end

  def show
    # This will display the details of the host review with the given ID
  end

  def edit
    # This will display the edit form for the host review with the given ID
  end

  def update
    if @host_review.update(host_review_params)
      redirect_to booking_host_review_path(@booking, @host_review), notice: 'Host review was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @host_review.destroy
    redirect_to @booking, notice: 'Host review was successfully deleted.'
  end

  private

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

  def set_host_review
    @host_review = @booking.host_reviews.find(params[:id])
  end

  def host_review_params
    params.require(:host_review).permit(:user_rating, :comment, :guest_id)
  end
end
