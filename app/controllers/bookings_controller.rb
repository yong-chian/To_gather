class BookingsController < ApplicationController
  before_action :set_activity, only: %i[new create show edit update destroy]

  def index
    @bookings = policy_scope(Booking.where(user_id: current_user))
    @myhostings = policy_scope(Booking.joins(:experience).where(experience: { user_id: current_user.id })) #will user.bookings_as_host list out all my hostings?
  end

  def show
    @booking = Booking.find(params[:id])
    authorize(@booking)
  end

  def new
    @booking = Booking.new
    authorize(@booking)
  end

  def create
    @booking = Booking.new(booking_params)
    #number of bookings with the experience and sum of the pax
    #if capacity < number_of_pax + (existing bookings pax) => fail
    #aggregate function
    @booking.user = current_user
    @booking.user_name = "#{current_user.first_name} #{current_user.last_name}"
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
      redirect_to activity_booking_path(@experience, @booking), notice: "Booking was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize(@booking)
    @booking.destroy
    redirect_to experience_path(@experience), notice: "Booking was successfully destroyed."
  end

  private

  def set_activity
    @activity = Activity.find(params[:activity_id])
  end

  def booking_params
    params.require(:booking).permit(:booking_date, :number_of_pax, :status, :comment, :completed)
  end
end
