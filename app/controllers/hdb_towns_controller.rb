class HdbTownsController < ApplicationController
  def index
    @hdb_towns = HdbTown.alphabetical
  end

  def show
    @hdb_town = HdbTown.find(params[:id])
  end
end
