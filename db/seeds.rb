GamePlatform.create!(name: "PC" )
GamePlatform.create!(name: "PlayStation" )
GamePlatform.create!(name: "Xbox" )
GamePlatform.create!(name: "Nintendo Switch" )

User.create!(
  email: "test01@gmail.com",
  password: "test01",
  confirmed_at: Time.now,
  admin: true
)
UserDetail.create!(
  account_name: "テストアカウント01",
  self_introduction: "テストアカウント01の自己紹介文",
  living_country: "US",
  native_country: "JP",
  date_of_birth: "20111114",
  gender: "男性",
  user_id: 1
)
LearnLanguage.create!(
  learn_language: "English",
  rank: "上級者",
  user_id: 1
)
LearnLanguage.create!(
  learn_language: "Chinese",
  rank: "初級者",
  learn_language_status: "フレンドのみ公開",
  user_id: 1
)
SpeakLanguage.create!(
  speak_language: "Japanese",
  rank: "ネイティブ",
  user_id: 1
)
GameAccount.create!(
  discord_id: "test01#0001",
  twitter_id: "@test01",
  user_id: 1
)
Game.create!(
  name: "VALORANT",
  user_id: 1
)
GameRelation.create!(
  game_id: 1,
  game_platform_id: 2
)
Recruitment.create!(
  title: "タイトル01",
  content: "投稿本文01",
  user_id: 1
)

User.create!(
  email: "test02@gmail.com",
  password: "test02",
  confirmed_at: Time.now,
  admin: false
)
UserDetail.create!(
  account_name: "テストアカウント02",
  self_introduction: "テストアカウント02の自己紹介文",
  living_country: "US",
  native_country: "JP",
  date_of_birth: "19951114",
  gender: "女性",
  user_id: 2
)
LearnLanguage.create!(
  learn_language: "Japanese",
  rank: "上級者",
  user_id: 2
)
LearnLanguage.create!(
  learn_language: "Chinese",
  rank: "中級者",
  learn_language_status: "非公開",
  user_id: 2
)
SpeakLanguage.create!(
  speak_language: "English",
  rank: "ネイティブ",
  user_id: 2
)
GameAccount.create!(
  discord_id: "test02#0002",
  twitter_id: "@test02",
  user_id: 2
)
Game.create!(
  name: "Apex Legends",
  user_id: 2
)
GameRelation.create!(
  game_id: 2,
  game_platform_id: 1
)
Recruitment.create!(
  title: "タイトル02",
  content: "投稿本文02",
  user_id: 2
)

User.create!(
  email: "test03@gmail.com",
  password: "test03",
  confirmed_at: Time.now,
  admin: false
)
UserDetail.create!(
  account_name: "テストアカウント03",
  self_introduction: "テストアカウント03の自己紹介文",
  living_country: "US",
  native_country: "JP",
  date_of_birth: "19970122",
  gender: "女性",
  user_id: 3
)
LearnLanguage.create!(
  learn_language: "Japanese",
  rank: "初級者",
  user_id: 3
)
LearnLanguage.create!(
  learn_language: "Chinese",
  rank: "上級者",
  learn_language_status: "非公開",
  user_id: 3
)
SpeakLanguage.create!(
  speak_language: "English",
  rank: "ネイティブ",
  user_id: 3
)
GameAccount.create!(
  discord_id: "test03#0003",
  twitter_id: "@test03",
  user_id: 3
)
Game.create!(
  name: "FINAL FANTASY 14",
  user_id: 3
)
GameRelation.create!(
  game_id: 3,
  game_platform_id: 1
)
Recruitment.create!(
  title: "タイトル03",
  content: "投稿本文03",
  user_id: 3
)

i = 4
160.times do
User.create!(
  email: Faker::Internet.email,
  password: "test00",
  confirmed_at: Time.now,
  admin: false
)
UserDetail.create!(
  account_name: Faker::Name.name,
  self_introduction: Faker::Quote.famous_last_words,
  living_country: "US",
  native_country: "JP",
  date_of_birth: Faker::Date.birthday(min_age: 20, max_age: 60),
  gender: rand(3),
  living_country_status: rand(3),
  native_country_status: rand(3),
  gender_status: rand(3),
  user_id: i
)
LearnLanguage.create!(
  learn_language: "Japanese",
  rank: rand(3),
  learn_language_status: rand(3),
  user_id: i
)
LearnLanguage.create!(
  learn_language: "Chinese",
  rank: rand(4),
  learn_language_status: rand(3),
  user_id: i
)
SpeakLanguage.create!(
  speak_language: "English",
  rank: "ネイティブ",
  user_id: i
)
GameAccount.create!(
  discord_id: Faker::Number.number(digits: 12),
  twitter_id: Faker::Number.number(digits: 12),
  user_id: i
)
Game.create!(
  name: Faker::Game.title,
  user_id: i
)
GameRelation.create!(
  game_id: i,
  game_platform_id: rand(4)+1
)
Recruitment.create!(
  title: Faker::Superhero.name,
  content: Faker::Book.title,
  user_id: i
)
i += 1
end
