class ParticipantReviewsController < ApplicationController
  before_action :set_booking
  before_action :set_participant_review, only: [:show, :edit, :update, :destroy]

  def new
    @participant_review = ParticipantReview.new
  end

  def create
    @participant_review = ParticipantReview.new(participant_review_params)
    @participant_review.booking = @booking

    if @participant_review.save
      redirect_to @booking, notice: 'Participant review was successfully created.'
    else
      render :new
    end
  end

  def show
    # This will display the details of the participant review with the given ID
  end

  def edit
    # This will display the edit form for the participant review with the given ID
  end

  def update
    if @participant_review.update(participant_review_params)
      redirect_to booking_participant_review_path(@booking, @participant_review), notice: 'Participant review was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @participant_review.destroy
    redirect_to @booking, notice: 'Participant review was successfully deleted.'
  end

  private

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

  def set_participant_review
    @participant_review = @booking.participant_reviews.find(params[:id])
  end

  def participant_review_params
    params.require(:participant_review).permit(:content, :activity_rating)
  end
end
