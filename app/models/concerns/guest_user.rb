module GuestUser
  extend ActiveSupport::Concern

  def self.guest_user_create
    unless User.exists?(email: 'guest@example.com')
      user = User.create!(
        email: 'guest@example.com',
        password: SecureRandom.urlsafe_base64,
        confirmed_at: Time.now,
        admin: false
      )
      UserDetail.create!(
        account_name: 'ゲストユーザー（一般）',
        self_introduction: 'ゲスト用ユーザーです。',
        living_country: "US",
        native_country: "JP",
        date_of_birth: '19900101',
        gender: rand(3),
        user_id: user.id
      )
      LearnLanguage.create!(
        learn_language: "English",
        rank: rand(3),
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
        game_platform_id: 0
      )
      Recruitment.create!(
        title: "ゲストユーザーの募集投稿",
        content: "ゲストユーザーの募集投稿内容が表示されます。",
        user_id: user.id
      )
    else
      user = User.find_by(email: 'guest@example.com')
    end
    unless User.exists?(email: 'guest2@example.com')
      user2 = User.create!(
        email: 'guest2@example.com',
        password: SecureRandom.urlsafe_base64,
        confirmed_at: Time.now,
        admin: false
      )
      UserDetail.create!(
        account_name: 'ゲストユーザー2（一般）',
        self_introduction: 'ゲスト用ユーザー2です。',
        living_country: "JP",
        native_country: "US",
        date_of_birth: '19900101',
        gender: rand(3),
        user_id: user2.id
      )
      LearnLanguage.create!(
        learn_language: "Japanese",
        rank: rand(3),
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
      game2 = Game.create!(
        name: 'Minecraft',
        user_id: user2.id
      )
      GameRelation.create!(
        game_id: game2.id,
        game_platform_id: 0
      )
      Recruitment.create!(
        title: "ゲストユーザー2の募集投稿",
        content: "ゲストユーザー2の募集投稿内容が表示されます。",
        user_id: user2.id
      )
    end
    unless User.exists?(email: 'guest3@example.com')
      user3 = User.create!(
        email: 'guest3@example.com',
        password: SecureRandom.urlsafe_base64,
        confirmed_at: Time.now,
        admin: false
      )
      UserDetail.create!(
        account_name: 'ゲストユーザー3（一般）',
        self_introduction: 'ゲスト用ユーザー3です。',
        living_country: "JP",
        native_country: "US",
        date_of_birth: '19900101',
        gender: rand(3),
        user_id: user3.id
      )
      LearnLanguage.create!(
        learn_language: "Japanese",
        rank: rand(3),
        user_id: user3.id
      )
      SpeakLanguage.create!(
        speak_language: "English",
        rank: "ネイティブ",
        user_id: user3.id
      )
      GameAccount.create!(
        discord_id: 'guest#0003',
        twitter_id: "@guest03",
        user_id: user3.id
      )
      game3 = Game.create!(
        name: 'Minecraft',
        user_id: user3.id
      )
      GameRelation.create!(
        game_id: game3.id,
        game_platform_id: 0
      )
      Recruitment.create!(
        title: "ゲストユーザー3の募集投稿",
        content: "ゲストユーザー3の募集投稿内容が表示されます。",
        user_id: user3.id
      )
    end
    unless User.exists?(email: 'guest4@example.com')
      user4 = User.create!(
        email: 'guest4@example.com',
        password: SecureRandom.urlsafe_base64,
        confirmed_at: Time.now,
        admin: false
      )
      UserDetail.create!(
        account_name: 'ゲストユーザー4（一般）',
        self_introduction: 'ゲスト用ユーザー4です。',
        living_country: "JP",
        native_country: "US",
        date_of_birth: '19900101',
        gender: rand(3),
        user_id: user4.id
      )
      LearnLanguage.create!(
        learn_language: "Japanese",
        rank: rand(3),
        user_id: user4.id
      )
      SpeakLanguage.create!(
        speak_language: "English",
        rank: "ネイティブ",
        user_id: user4.id
      )
      GameAccount.create!(
        discord_id: 'guest#0004',
        twitter_id: "@guest04",
        user_id: user4.id
      )
      game4 = Game.create!(
        name: 'Minecraft',
        user_id: user4.id
      )
      GameRelation.create!(
        game_id: game4.id,
        game_platform_id: 0
      )
      Recruitment.create!(
        title: "ゲストユーザー4の募集投稿",
        content: "ゲストユーザー4の募集投稿内容が表示されます。",
        user_id: user4.id
      )
    end
    unless FriendRelation.exists?(from_applicant_id: user.id, to_target_id: user2.id)
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
      Message.create!(
        message: "message post test from guest_user01",
        user_id: user.id,
        chat_room_id: chat_room.id
      )
      Message.create!(
        message: "from user02, Hello, this message is a sending test",
        user_id: user2.id,
        chat_room_id: chat_room.id
      )
    end
    unless FriendRelation.exists?(from_applicant_id: user.id, to_target_id: user3.id)
      FriendRelation.create!(
        from_applicant_id: user.id,
        to_target_id: user3.id,
        status: 2
      )
    end
    unless FriendRelation.exists?(from_applicant_id: user4.id, to_target_id: user.id)
      FriendRelation.create!(
        from_applicant_id: user4.id,
        to_target_id: user.id,
        status: 2
      )
    end
  end

  def self.admin_guest_user_create
    User.guest_user_create
    user = User.find_by(email: 'guest@example.com')
    user2 = User.find_by(email: 'guest2@example.com')
    user3 = User.find_by(email: 'guest3@example.com')
    user4 = User.find_by(email: 'guest4@example.com')
    unless User.exists?(email: 'admin.guest@example.com')
      admin = User.create!(
        email: 'admin.guest@example.com',
        password: SecureRandom.urlsafe_base64,
        confirmed_at: Time.now,
        admin: true
      )
      UserDetail.create!(
        account_name: 'ゲストユーザー（管理者）',
        self_introduction: 'ゲスト用管理者ユーザーです。',
        living_country: "US",
        native_country: "JP",
        date_of_birth: '19900101',
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
        discord_id: 'guest#0001',
        twitter_id: "@guest01",
        user_id: admin.id
      )
      game = Game.create!(
        name: 'Minecraft',
        user_id: admin.id
      )
      GameRelation.create!(
        game_id: game.id,
        game_platform_id: 0
      )
      Recruitment.create!(
        title: "ゲストユーザーの募集投稿",
        content: "ゲストユーザーの募集投稿内容が表示されます。",
        user_id: admin.id
      )
    else
      admin = User.find_by(email: 'admin.guest@example.com')
    end
    unless FriendRelation.exists?(from_applicant_id: admin.id, to_target_id: user2.id)
      FriendRelation.create!(
        from_applicant_id: admin.id,
        to_target_id: user2.id,
        status: 1
      )
      chat_room = ChatRoom.create!()
      Participant.create!(
        user_id: admin.id,
        chat_room_id: chat_room.id
      )
      Participant.create!(
        user_id: user2.id,
        chat_room_id: chat_room.id
      )
      Message.create!(
        message: "message post test from admin_guest_user!",
        user_id: admin.id,
        chat_room_id: chat_room.id
      )
      Message.create!(
        message: "to admin user, Hello, this message is a sending test",
        user_id: user2.id,
        chat_room_id: chat_room.id
      )
    end
    unless FriendRelation.exists?(from_applicant_id: admin.id, to_target_id: user3.id)
      FriendRelation.create!(
        from_applicant_id: admin.id,
        to_target_id: user3.id,
        status: 2
      )
    end
    unless FriendRelation.exists?(from_applicant_id: user4.id, to_target_id: admin.id)
      FriendRelation.create!(
        from_applicant_id: user4.id,
        to_target_id: admin.id,
        status: 2
      )
    end
  end

  def self.reset_guest_users
    User.find_by(email: 'admin.guest@example.com').destroy rescue e
    User.find_by(email: 'guest@example.com').destroy rescue e
    User.find_by(email: 'guest2@example.com').destroy rescue e
    User.find_by(email: 'guest3@example.com').destroy rescue e
    User.find_by(email: 'guest4@example.com').destroy rescue e
    User.admin_guest_user_create
  end

end
