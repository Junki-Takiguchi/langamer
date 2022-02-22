FactoryBot.define do
  factory :admin, class: User do
    email { Faker::Internet.email }
    password {'1234567+A'}
    password_confirmation {'1234567+A'}
    admin { true }
  end

  factory :admin_detail, class: UserDetail do
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
    user_id { User.find_by(admin: true) }
  end

  factory :admin_learn_language, class: LearnLanguage do
    language = ["Japanese", "English", "Chinese"]
    n = language.sample
    learn_language { n }
    rank { rand(4) }
    learn_language_status { rand(3) }
    user_id { User.find_by(admin: true) }
  end

  factory :admin_speak_language, class: SpeakLanguage do
    language = ["Japanese", "English", "Chinese"]
    language = language.select{ |lang| lang != LearnLanguage.find_by(user_id: (User.find_by(admin: true).id)).learn_language }
    n = language.sample
    speak_language { n }
    rank { "ネイティブ" }
    speak_language_status { rand(3) }
    user_id { User.find_by(admin: true) }
  end

  factory :admin_game_account, class: GameAccount do
    discord_id { Faker::Number.number(digits: 12) }
    twitter_id { Faker::Number.number(digits: 12) }
    user_id { User.find_by(admin: true) }
  end

  factory :admin_game, class: Game do
    name { Faker::Game.title }
    user_id { User.find_by(admin: true) }
  end

  factory :game_platform, class: GamePlatform do
    name { "PlayStation" }
  end

  factory :admin_game_relation, class: GameRelation do
    game_id { Game.find_by(user_id: (User.find_by(admin: true).id)).id }
    game_platform_id { 1 }
  end



  factory :user, class: User do
    email { Faker::Internet.email }
    password {'1234567+A'}
    password_confirmation {'1234567+A'}
    admin { false }
  end

  factory :user_detail, class: UserDetail do
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
    user_id { User.find_by(admin: false) }
  end

  factory :user_learn_language, class: LearnLanguage do
    language = ["Japanese", "English", "Chinese"]
    n = language.sample
    learn_language { n }
    rank { rand(4) }
    learn_language_status { rand(3) }
    user_id { User.find_by(admin: false) }
  end

  factory :user_speak_language, class: SpeakLanguage do
    language = ["Japanese", "English", "Chinese"]
    language = language.select{ |lang| lang != LearnLanguage.find_by(user_id: (User.find_by(admin: true).id)).learn_language }
    n = language.sample
    speak_language { n }
    rank { "ネイティブ" }
    speak_language_status { rand(3) }
    user_id { User.find_by(admin: false) }
  end

  factory :user_game_account, class: GameAccount do
    discord_id { Faker::Number.number(digits: 12) }
    twitter_id { Faker::Number.number(digits: 12) }
    user_id { User.find_by(admin: false) }
  end

  factory :user_game, class: Game do
    name { Faker::Game.title }
    user_id { User.find_by(admin: false) }
  end

  factory :user_game_relation, class: GameRelation do
    game_id { Game.find_by(user_id: (User.find_by(admin: false).id)).id }
    game_platform_id { 1 }
  end


end
