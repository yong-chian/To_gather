class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @activities_near_you = Activity.all.sample(3) #too add geo location
    @activities = Activity.all
  end

  def show
    @activity = Activity.find(params[:id])
  end
end
