class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @activities_near_you = Activity.all.sample(3) #too add geo location
    @activities = Activity.all
    @markers = @activities.geocoded.map do |activity|
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
