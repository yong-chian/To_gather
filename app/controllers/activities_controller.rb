class ActivitiesController < ApplicationController
  def new
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :description, :price, :max_capacity, :availability, :meeting_location, :minimum_age, :policies, photos: [])
  end
end
