class ActivitiesController < ApplicationController
  before_action :set_activity, only: %i[show edit update destroy toggle_favorite]

  def index
    if params[:query].present?
      @activities = policy_scope(Activity.search_by_name_and_description(params[:query]))
    else
      @activities = policy_scope(Activity).order("RANDOM()")
    end
    @markers = @activities.geocoded.map do |activity|
      {
        lat: activity.latitude,
        lng: activity.longitude,
        info_window: render_to_string(partial: "popup", locals: {activity: activity}),
      }
    end
  end

  def show
    @bookings = @activity.bookings
    @participant_reviews = ParticipantReview.where(booking_id: @bookings.pluck(:id))
    @booking = Booking.new
    @marker = [{
      lat: @activity.latitude,
      lng: @activity.longitude
    }]
  end

  def new
    @activity = Activity.new
    authorize(@activity)
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.user = current_user
    availabilities = availability_params[:availabilities_start_time].split(", ")
    availabilities.map { |time| @activity.availabilities.build(
      start_time: time,
      end_time: time
      )
    }
    interests = params["activity"]["interest_ids"]
    interests.each do |interest|
      @activity.interests << Interest.find(interest.to_i)
    end
    authorize(@activity)
    if @activity.save!
      redirect_to activity_path(@activity), notice: "Activity was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @activity.update(activity_params)
      redirect_to activity_path(@activity), notice: "Activity was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @activity.destroy
    redirect_to activities_path, notice: "Activity was successfully destroyed."
  end

  def toggle_favorite
    current_user.favorited?(@activity) ? current_user.unfavorite(@activity) : current_user.favorite(@activity)
  end

  # def add_interest

  #   interests = params["user"]["interest_ids"] # array of selected interest ids
  #   interests.each do |interest_id|
  #     unless current_user.interests.exists?(id: interest_id.to_i)
  #       UserInterest.create(user: current_user, interest_id: interest_id.to_i)
  #     end
  #   end
  #   respond_to do |format|
  #     format.html { redirect_to root_path, notice: "Interests have been updated" }
  #     format.text { render partial: "update_interest", formats: [:html]}
  #   end
  # end

  private

  def set_activity
    @activity = Activity.find(params[:id])
    authorize(@activity)
  end

  def activity_params
    params.require(:activity).permit(:name, :description, :price, :max_capacity, :meeting_location, :minimum_age, :policies, interests: [], photos: [])
  end

  def availability_params
    params.require(:activity).permit(:availabilities_start_time)
  end
end
