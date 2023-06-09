# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  def add_interest
    @user = current_user
    @interests = Interest.all
  end
  # GET /resource/sign_up
  # def new
  #   super\
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name avatar])
  end

  def update_interest
    interests = params["user"]["interest_ids"] # array of selected interest ids
    interests.each do |interest_id|
      unless current_user.interests.exists?(id: interest_id.to_i)
        UserInterest.create(user: current_user, interest_id: interest_id.to_i)
      end
    end
    respond_to do |format|
      format.html { redirect_to root_path, notice: "Interests have been updated" }
      format.text { render partial: "update_interest", formats: [:html]}
    end


  end
  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  def after_sign_up_path_for(resource)
    users_add_interest_path # Or :prefix_to_your_route
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
