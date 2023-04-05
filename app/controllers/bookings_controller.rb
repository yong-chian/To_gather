class BookingsController < ApplicationController
  before_action :set_activity, only: %i[new create show edit update destroy]

  def index
    @bookings = policy_scope(Booking.where(user_id: current_user))
    @my_hostings = current_user.bookings_as_host
  end

  def show
    @booking = Booking.find(params[:id])
    authorize(@booking)
    @participant_review = @booking.participant_reviews.first
  end

  def new
    @booking = Booking.new
    authorize(@booking)
  end

  def create
    @booking = Booking.new(booking_params)
    #number of bookings with the activity and sum of the pax
    #if capacity < number_of_pax + (existing bookings pax) => fail
    #aggregate function
    @booking.user = current_user
    @booking.user_name = "#{current_user.first_name} #{current_user.last_name}"
    @booking.availability = Availability.find(params[:booking][:availability_id].to_i)
    @booking.activity = @activity
    @booking.status = "Pending"

    authorize(@booking)

    if @booking.save!
      redirect_to activity_booking_path(@activity, @booking), notice: "Booking was successfully placed."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    authorize(@booking)
  end

  def update
    @booking = Booking.find(params[:id])
    authorize(@booking)
    if @booking.update(booking_params)
      redirect_to activity_booking_path(@activity, @booking), notice: "Booking was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize(@booking)
    @booking.destroy
    redirect_to activity_path(@activity), notice: "Booking was successfully destroyed."
  end

  private

  def set_activity
    @activity = Activity.find(params[:activity_id])
  end

  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :number_of_pax, :status, :comment, :completed, :availability_id)
  end
end
