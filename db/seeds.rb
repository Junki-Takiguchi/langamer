GamePlatform.create!(name: "PC" )
GamePlatform.create!(name: "PlayStation" )
GamePlatform.create!(name: "Xbox" )
GamePlatform.create!(name: "Nintendo Switch" )

user = User.create!(
  email: "test01@gmail.com",
  password: "test01",
  # confirmed_at: Time.now,
  admin: false
)
UserDetail.create!(
  account_name: 'ゲストユーザー（一般）',
  self_introduction: 'ゲスト用ユーザーです。',
  living_country: "US",
  native_country: "JP",
  date_of_birth: Faker::Date.birthday(min_age: 20, max_age: 60),
  gender: rand(3),
  user_id: user.id
)
LearnLanguage.create!(
  learn_language: "English",
  rank: rand(4),
  user_id: user.id
)
LearnLanguage.create!(
  learn_language: "Chinese",
  rank: rand(4),
  learn_language_status: rand(3),
  user_id: user.id
)
SpeakLanguage.create!(
  speak_language: "Japanese",
  rank: "ネイティブ",
  user_id: user.id
)
GameAccount.create!(
  discord_id: 'guest#0001',
  twitter_id: "@guest01",
  user_id: user.id
)
game = Game.create!(
  name: 'Minecraft',
  user_id: user.id
)
GameRelation.create!(
  game_id: game.id,
  game_platform_id: 1
)
Recruitment.create!(
  title: "ゲストユーザーの募集投稿",
  content: "ゲストユーザーの募集投稿内容が表示されます。",
  user_id: user.id
)

user2 = User.create!(
  email: "test02@gmail.com",
  password: "test02",
  # confirmed_at: Time.now,
  admin: false
)
UserDetail.create!(
  account_name: 'ゲストユーザー2（一般）',
  self_introduction: 'ゲスト用ユーザー2です。',
  living_country: "JP",
  native_country: "US",
  date_of_birth: Faker::Date.birthday(min_age: 20, max_age: 60),
  gender: rand(3),
  user_id: user2.id
)
LearnLanguage.create!(
  learn_language: "Japanese",
  rank: rand(4),
  user_id: user2.id
)
LearnLanguage.create!(
  learn_language: "Chinese",
  rank: rand(4),
  learn_language_status: rand(3),
  user_id: user2.id
)
SpeakLanguage.create!(
  speak_language: "English",
  rank: "ネイティブ",
  user_id: user2.id
)
GameAccount.create!(
  discord_id: 'guest#0002',
  twitter_id: "@guest02",
  user_id: user2.id
)
game = Game.create!(
  name: 'Minecraft',
  user_id: user2.id
)
GameRelation.create!(
  game_id: game.id,
  game_platform_id: 1
)
Recruitment.create!(
  title: "ゲストユーザーの募集投稿",
  content: "ゲストユーザーの募集投稿内容が表示されます。",
  user_id: user2.id
)

user3 = User.create!(
  email: "test03@gmail.com",
  password: "test03",
  # confirmed_at: Time.now,
  admin: false
)
UserDetail.create!(
  account_name: 'ゲストユーザー3（一般）',
  self_introduction: 'ゲスト用ユーザー3です。',
  living_country: "JP",
  native_country: "US",
  date_of_birth: Faker::Date.birthday(min_age: 20, max_age: 60),
  gender: rand(3),
  user_id: user3.id
)
LearnLanguage.create!(
  learn_language: "Japanese",
  rank: rand(4),
  user_id: user3.id
)
LearnLanguage.create!(
  learn_language: "Chinese",
  rank: rand(4),
  learn_language_status: rand(3),
  user_id: user3.id
)
SpeakLanguage.create!(
  speak_language: "English",
  rank: "ネイティブ",
  user_id: user3.id
)
GameAccount.create!(
  discord_id: 'guest#0002',
  twitter_id: "@guest02",
  user_id: user3.id
)
game = Game.create!(
  name: 'Minecraft',
  user_id: user3.id
)
GameRelation.create!(
  game_id: game.id,
  game_platform_id: 1
)
Recruitment.create!(
  title: "ゲストユーザーの募集投稿",
  content: "ゲストユーザーの募集投稿内容が表示されます。",
  user_id: user3.id
)

user4 = User.create!(
  email: "test04@gmail.com",
  password: "test04",
  # confirmed_at: Time.now,
  admin: false
)
UserDetail.create!(
  account_name: 'ゲストユーザー4（一般）',
  self_introduction: 'ゲスト用ユーザー4です。',
  living_country: "JP",
  native_country: "US",
  date_of_birth: Faker::Date.birthday(min_age: 20, max_age: 60),
  gender: rand(3),
  user_id: user4.id
)
LearnLanguage.create!(
  learn_language: "Japanese",
  rank: rand(4),
  user_id: user4.id
)
LearnLanguage.create!(
  learn_language: "Chinese",
  rank: rand(4),
  learn_language_status: rand(3),
  user_id: user4.id
)
SpeakLanguage.create!(
  speak_language: "English",
  rank: "ネイティブ",
  user_id: user4.id
)
GameAccount.create!(
  discord_id: 'guest#0002',
  twitter_id: "@guest02",
  user_id: user4.id
)
game = Game.create!(
  name: 'Minecraft',
  user_id: user4.id
)
GameRelation.create!(
  game_id: game.id,
  game_platform_id: 1
)
Recruitment.create!(
  title: "ゲストユーザーの募集投稿",
  content: "ゲストユーザーの募集投稿内容が表示されます。",
  user_id: user4.id
)

FriendRelation.create!(
  from_applicant_id: user.id,
  to_target_id: user2.id,
  status: 1
)
chat_room = ChatRoom.create!()
Participant.create!(
  user_id: user.id,
  chat_room_id: chat_room.id
)
Participant.create!(
  user_id: user2.id,
  chat_room_id: chat_room.id
)
12.times do
  Message.create!(
    message: Faker::Quote.famous_last_words,
    user_id: user.id,
    chat_room_id: chat_room.id
  )
  Message.create!(
    message: Faker::Quote.famous_last_words,
    user_id: user2.id,
    chat_room_id: chat_room.id
  )
end
FriendRelation.create!(
  from_applicant_id: user.id,
  to_target_id: user3.id,
  status: 2
)
FriendRelation.create!(
  from_applicant_id: user4.id,
  to_target_id: user.id,
  status: 2
)


admin = User.create!(
  email: 'admin01@gmail.com',
  password: 'admin01',
  # confirmed_at: Time.now,
  admin: true
)
UserDetail.create!(
  account_name: 'ゲストユーザー（管理者）',
  self_introduction: 'ゲスト用管理者ユーザーです。',
  living_country: "US",
  native_country: "JP",
  date_of_birth: Faker::Date.birthday(min_age: 20, max_age: 60),
  gender: rand(3),
  user_id: admin.id
)
LearnLanguage.create!(
  learn_language: "English",
  rank: rand(3),
  user_id: admin.id
)
SpeakLanguage.create!(
  speak_language: "Japanese",
  rank: "ネイティブ",
  user_id: admin.id
)
GameAccount.create!(
  discord_id: 'admin#0001',
  twitter_id: "@admin01",
  user_id: admin.id
)
game = Game.create!(
  name: 'Minecraft',
  user_id: admin.id
)
GameRelation.create!(
  game_id: game.id,
  game_platform_id: 1
)
Recruitment.create!(
  title: "管理者ユーザーの募集投稿",
  content: "管理者ユーザーの募集投稿内容が表示されます。",
  user_id: admin.id
)
FriendRelation.create!(
  from_applicant_id: admin.id,
  to_target_id: user2.id,
  status: 1
)
chat_room2 = ChatRoom.create!()
Participant.create!(
  user_id: admin.id,
  chat_room_id: chat_room2.id
)
Participant.create!(
  user_id: user2.id,
  chat_room_id: chat_room2.id
)
Message.create!(
  message: "message post test from admin_guest_user!",
  user_id: admin.id,
  chat_room_id: chat_room2.id
)
Message.create!(
  message: "to admin user, Hello, this message is a sending test",
  user_id: user2.id,
  chat_room_id: chat_room2.id
)
12.times do
  Message.create!(
    message: Faker::Quote.famous_last_words,
    user_id: admin.id,
    chat_room_id: chat_room2.id
  )
  Message.create!(
    message: Faker::Quote.famous_last_words,
    user_id: user2.id,
    chat_room_id: chat_room2.id
  )
end
FriendRelation.create!(
  from_applicant_id: admin.id,
  to_target_id: user3.id,
  status: 2
)
FriendRelation.create!(
  from_applicant_id: user4.id,
  to_target_id: admin.id,
  status: 2
)

i = 1
country = ["JP", "CH", "US"]
language = ["Japanese", "English", "Chinese"]

20.times do
  User.create!(
    email: Faker::Internet.email,
    password: SecureRandom.urlsafe_base64,
    # confirmed_at: Time.now,
    admin: false
  )
  c1 = country.sample
  country.delete(c1)
  c2 = country.sample
  UserDetail.create!(
    account_name: Faker::Name.name,
    self_introduction: Faker::Quote.famous_last_words,
    living_country: c1,
    native_country: c2,
    date_of_birth: Faker::Date.birthday(min_age: 20, max_age: 60),
    gender: rand(3),
    living_country_status: rand(3),
    native_country_status: rand(3),
    gender_status: rand(3),
    user_id: i
  )
  n = language.sample
  LearnLanguage.create(
    learn_language: n,
    rank: rand(4),
    learn_language_status: rand(3),
    user_id: i
  )
  language.delete(n)
  n = language.sample
  LearnLanguage.create(
    learn_language: n,
    rank: rand(4),
    learn_language_status: rand(3),
    user_id: i
  )
  language.delete(n)
  SpeakLanguage.create(
    speak_language: n,
    rank: "ネイティブ",
    user_id: i
  )
  GameAccount.create!(
    discord_id: Faker::Number.number(digits: 12),
    twitter_id: Faker::Number.number(digits: 12),
    user_id: i
  )
  game = Game.create!(
    name: Faker::Game.title,
    user_id: i
  )
  GameRelation.create!(
    game_id: game.id,
    game_platform_id: rand(4)+1
  )
  Recruitment.create!(
    title: Faker::Creature::Animal.name,
    content: Faker::Book.title,
    user_id: i
  )
  i += 1
  country = ["JP", "CH", "US"]
  language = ["Japanese", "English", "Chinese"]
end
