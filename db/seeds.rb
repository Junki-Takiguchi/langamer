GamePlatform.create!(name: "PC" )
GamePlatform.create!(name: "PlayStation" )
GamePlatform.create!(name: "Xbox" )
GamePlatform.create!(name: "Nintendo Switch" )

User.create!(
  email: "test01@gmail.com",
  password: "test01",
  admin: true
)
UserDetail.create!(
  account_name: "テストアカウント01",
  self_introduction: "テストアカウント01の自己紹介文",
  #learn_language: "English",
  #first_language: "Japanese",
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
  admin: false
)
UserDetail.create!(
  account_name: "テストアカウント02",
  self_introduction: "テストアカウント02の自己紹介文",
  #learn_language: "English",
  #first_language: "Japanese",
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
