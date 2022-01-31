class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters , if: :devise_controller?

  private
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [
        user_details_attributes: [
          :acount_name,
          :profile_picture,
          :self_introduction,
          :learn_language,
          :first_language,
          :second_language,
          :living_country,
          :native_country,
          :date_of_birth,
          :gender
        ]
      ])
      devise_parameter_sanitizer.permit(:account_update, keys: [
        user_details_attributes: [
          :acount_name,
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
        game_accounts_attributes: [
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
