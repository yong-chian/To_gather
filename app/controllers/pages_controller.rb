class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @activities = Activity.all.sample(3)
    @map_activities = Activity.all
    @markers = @map_activities.geocoded.map do |activity|
      {
        lat: activity.latitude,
        lng: activity.longitude,
        info_window: render_to_string(partial: "popup", locals: {activity: activity}),
      }
    end
  end

  def show
    @activity = Activity.find(params[:id])
  end
end
