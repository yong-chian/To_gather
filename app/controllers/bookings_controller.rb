class BookingsController < ApplicationController
  before_action :set_activity, only: %i[new create show edit update destroy]
  skip_after_action :verify_authorized, only: %i[confirmed completed]

  def index
    @bookings = policy_scope(Booking.where(user_id: current_user))
    @my_hostings = current_user.bookings_as_host
    # @chatroom = Chatroom.find(2)
  end

  def confirmed
    @bookings = Booking.where(user_id: current_user.id, status: "Confirmed", completed: false)
    @confirmed_bookings = current_user.bookings.filter do |booking|
      booking.status = "Confirmed"
    end
    # @chatroom = Chatroom.find(2)
  end

  def completed
    @bookings = Booking.where(user_id: current_user.id, status: "Completed", completed: true)
    @completed_bookings = current_user.bookings.filter do |booking|
      booking.status = "Confirmed"
      booking.completed? == true
    end
    # @chatroom = Chatroom.find(2)
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
    @booking.status = "Pending Payment"

    authorize(@booking)

    if @booking.save!
      redirect_to activity_booking_path(@activity, @booking), notice: "Woohoo!🎉 Your booking has been successfully placed."
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
