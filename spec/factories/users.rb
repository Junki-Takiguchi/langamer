FactoryBot.define do

  factory :game_platform, class: GamePlatform do
    name { "PlayStation" }
  end

  factory :admin, class: User do
    email { "rspec_admin@sample.com" }
    password {'1234567+A'}
    password_confirmation {'1234567+A'}
    admin { true }
  end

  factory :admin_detail, class: UserDetail do
    profile_picture  { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/default.png')) }
    country = ["JP", "CH", "US"]
    c1 = country.sample
    country.delete(c1)
    c2 = country.sample
    account_name { Faker::Name.name }
    self_introduction { Faker::Quote.famous_last_words }
    living_country { c1 }
    native_country { c2 }
    date_of_birth { Faker::Date.birthday(min_age: 20, max_age: 60) }
    gender { rand(3) }
    living_country_status { rand(3) }
    native_country_status { rand(3) }
    gender_status { rand(3) }
    user_id { User.find_by(email: "rspec_admin@sample.com").id }
  end

  factory :admin_learn_language, class: LearnLanguage do
    learn_language { "Japanese" }
    rank { rand(4) }
    learn_language_status { rand(3) }
    user_id { User.find_by(email: "rspec_admin@sample.com").id }
  end

  factory :admin_speak_language, class: SpeakLanguage do
    speak_language { "English" }
    rank { "ネイティブ" }
    speak_language_status { rand(3) }
    user_id { User.find_by(email: "rspec_admin@sample.com").id }
  end

  factory :admin_game_account, class: GameAccount do
    discord_id { Faker::Number.number(digits: 12) }
    twitter_id { Faker::Number.number(digits: 12) }
    user_id { User.find_by(email: "rspec_admin@sample.com").id }
  end

  factory :admin_game, class: Game do
    name { Faker::Game.title }
    user_id { User.find_by(email: "rspec_admin@sample.com").id }
  end

  factory :admin_game_relation, class: GameRelation do
    game_id {
      Game.find_by(user_id:
        User.find_by(email: "rspec_admin@sample.com").id
      ).id
    }
    game_platform_id { 2 }
  end

  factory :user, class: User do
    email { "rspec_user@sample.com" }
    password {'1234567+A'}
    password_confirmation {'1234567+A'}
    admin { false }
  end

  factory :user_detail, class: UserDetail do
    profile_picture  {  Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/default.png')) }
    country = ["JP", "CH", "US"]
    c1 = country.sample
    country.delete(c1)
    c2 = country.sample
    account_name { Faker::Name.name }
    self_introduction { Faker::Quote.famous_last_words }
    living_country { c1 }
    native_country { c2 }
    date_of_birth { Faker::Date.birthday(min_age: 20, max_age: 60) }
    gender { rand(3) }
    living_country_status { rand(3) }
    native_country_status { rand(3) }
    gender_status { rand(3) }
    user_id { User.find_by(email: "rspec_user@sample.com").id }
  end

  factory :user_learn_language, class: LearnLanguage do
    learn_language { "Chinese" }
    rank { rand(4) }
    learn_language_status { rand(3) }
    user_id { User.find_by(email: "rspec_user@sample.com").id }
  end

  factory :user_speak_language, class: SpeakLanguage do
    speak_language { "Japanese" }
    rank { "ネイティブ" }
    speak_language_status { rand(3) }
    user_id { User.find_by(email: "rspec_user@sample.com").id }
  end

  factory :user_game_account, class: GameAccount do
    discord_id { Faker::Number.number(digits: 12) }
    twitter_id { Faker::Number.number(digits: 12) }
    user_id { User.find_by(email: "rspec_user@sample.com").id }
  end

  factory :user_game, class: Game do
    name { Faker::Game.title }
    user_id { User.find_by(email: "rspec_user@sample.com").id }
  end

  factory :user_game_relation, class: GameRelation do
    game_id {
      Game.find_by(user_id:
        User.find_by(email: "rspec_user@sample.com").id
      ).id
    }
    game_platform_id { 2 }
  end

  factory :friend, class: FriendRelation do
    from_applicant_id { User.find_by(email: "rspec_user@sample.com").id }
    to_target_id { User.find_by(email: "rspec_admin@sample.com").id }
    status { 1 }
  end

  factory :applicant, class: FriendRelation do
    from_applicant_id { User.find_by(email: "rspec_user@sample.com").id }
    to_target_id { User.find_by(email: "rspec_admin@sample.com").id }
    status { 2 }
  end

  factory :target, class: FriendRelation do
    from_applicant_id { User.find_by(email: "rspec_admin@sample.com").id }
    to_target_id { User.find_by(email: "rspec_user@sample.com").id }
    status { 2 }
  end


end
