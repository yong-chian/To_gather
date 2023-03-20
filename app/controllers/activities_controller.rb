class ActivitiesController < ApplicationController
  def index
    @activities = policy_scope(Activity)
  end

  def show
    @activity = Activity.find(params[:id])
    authorize(@activity)
  end

  def new
    @activity = Activity.new
    authorize(@activity)
  end

  def create
    @activity = Activity.new(experience_params)
    @activity.user = current_user

    authorize(@activity)

    if @activity.save!
      redirect_to activity_path(@activity), notice: "Activity was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :description, :price, :max_capacity, :availability, :meeting_location, :minimum_age, :policies, photos: [])
  end
end
