class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @activities = Activity.all.sample(3)
  end

  def show
    @activity = Activity.find(params[:id])
  end
end
