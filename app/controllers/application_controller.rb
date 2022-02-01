class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  before_action :configure_sign_up_params, only: [:create], if: :devise_controller?
  before_action :configure_account_update_params, only: [:update], if: :devise_controller?

  private

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      user_detail_attributes: [
        :id,
        :account_name,
        :self_introduction,
        :learn_language,
        :first_language,
        :second_language,
        :living_country,
        :native_country,
        :date_of_birth,
        :gender
      ],
      game_account_attributes: [
        :id,
        :discord_id,
        :twitter_id
      ]
    ])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [
      user_detail_attributes: [
        :id,
        :account_name,
        :profile_picture,
        :self_introduction,
        :learn_language,
        :first_language,
        :second_language,
        :living_country,
        :native_country,
        :date_of_birth,
        :gender
      ],
      game_account_attributes: [
        :id,
        :discord_id,
        :steam_id,
        :origin_id,
        :riot_id,
        :psn_id,
        :xbox_id,
        :nintendo_id,
        :other_id,
        :twitter_id
      ]
    ])
  end



end
