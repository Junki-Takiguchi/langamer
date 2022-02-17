class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, except: :search

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
        :living_country,
        :living_country_status,
        :native_country,
        :native_country_status,
        :date_of_birth,
        :date_of_birth_status,
        :gender,
        :gender_status
      ],
      learn_languages_attributes: [
        :id,
        :learn_language,
        :rank,
        :learn_language_status
      ],
      speak_languages_attributes: [
        :id,
        :speak_language,
        :rank,
        :speak_language_status
      ],
      games_attributes: [
        :id,
        :name,
        game_relations_attributes: [
          :id,
          :game_platform_id
        ],
      ],
      game_account_attributes: [
        :id,
        :discord_id,
        :discord_id_status,
        :twitter_id,
        :twitter_id_status
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
        :living_country,
        :living_country_status,
        :native_country,
        :native_country_status,
        :date_of_birth,
        :date_of_birth_status,
        :gender,
        :gender_status
      ],
      learn_languages_attributes: [
        :id,
        :learn_language,
        :rank,
        :learn_language_status
      ],
      speak_languages_attributes: [
        :id,
        :speak_language,
        :rank,
        :speak_language_status
      ],
      games_attributes: [
        :id,
        :name,
        game_relations_attributes: [
          :id,
          :game_platform_id
        ],
      ],
      game_account_attributes: [
        :id,
        :discord_id,
        :discord_id_status,
        :twitter_id,
        :twitter_id_status,
        :steam_id,
        :steam_id_status,
        :origin_id,
        :origin_id_status,
        :riot_id,
        :riot_id_status,
        :psn_id,
        :psn_id_status,
        :xbox_id,
        :xbox_id_status,
        :nintendo_id,
        :nintendo_id_status,
        :other_id,
        :other_id_status
      ]
    ])
  end

end
