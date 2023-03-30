class ParticipantReviewsController < ApplicationController
  before_action :set_booking, only: %i[new create show edit update destroy]
  before_action :set_participant_review, only: [:show]

  def index
    #code to display all reviews for an activity or a booking
    @participant_reviews = policy_scope(ParticipantReview.all)
  end

  def show
    # This will display the details of the participant review with the given ID
  end

  def new
    @participant_review = ParticipantReview.new(booking: @booking)
    authorize(@participant_review)
  end

  def create
    @activity = Activity.find(@booking.activity_id)
    if @booking.user != current_user
      redirect_to activity_booking_path(@activity, @booking), alert: "You are not authorized to leave a review for this booking"
    elsif @booking.participant_reviews.present?
      redirect_to booking_participant_review_path(@booking, @booking.participant_reviews.first), alert: "You have already reviewed for this booking"
      return
    end
    @participant_review = @booking.participant_reviews.build(participant_review_params)
    @participant_review.user_name = @booking.user_name
    @participant_review.activity = @activity

    authorize(@participant_review)

    if @participant_review.save
      redirect_to activity_booking_path(@activity, @booking), notice: 'Review was successfully created.'
    else
      render :new
    end
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
    authorize(@booking)
  end

  def set_participant_review
    @participant_review = ParticipantReview.find(params[:id])
  end

  def participant_review_params
    params.require(:participant_review).permit(:content, :activity_rating)
  end
end
