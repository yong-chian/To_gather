class FavoritesController < ApplicationController
  def index
    @user = current_user
    @favorites = @user.favorites
    policy_scope(@favorites)
  end
end
