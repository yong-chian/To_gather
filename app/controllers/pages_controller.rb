class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if user_signed_in? && current_user.home_address != nil
      user_latitude = current_user.latitude
      user_longitude = current_user.longitude
      radius_in_km = 5
      @activities_near_you = Activity.near([user_latitude, user_longitude], radius_in_km).limit(3)
    else
      @activities_near_you = Activity.all.sample(3)
    end
    @activities = Activity.all
    @markers = @activities.geocoded.map do |activity|
      {
        lat: activity.latitude,
        lng: activity.longitude,
        info_window: render_to_string(partial: "popup", locals: {activity: activity}),
      }
    end

    if user_signed_in? && current_user.interests.present?
      user_interests = current_user.interests
      @interests_based_activities = Activity.joins(:interests)
                                         .where('activity_interests.interest_id IN (?)', user_interests.map(&:id))
                                         .order('RANDOM()')
                                         .limit(3)
    else
      #without signing in or interests selected, it will show the top activities in the page
      top_rated_activities = Activity.left_joins(:participant_reviews) #user left_joins such that activity without reviews are included too
                                     .group(:id)
                                     .order('AVG(participant_reviews.activity_rating) DESC')
                                     .limit(10)
      @interests_based_activities = top_rated_activities.sample(3)
    end
  end

  def show
    @activity = Activity.find(params[:id])
  end
end
