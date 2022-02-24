# bundle exec rspec spec/models/user_spec.rb

require 'rails_helper'
describe 'ユーザーモデル機能', type: :model do
  before do
    FactoryBot.create(:user)
  end
  describe 'バリデーションのテスト' do
    context '正常値を入れた場合' do
      it 'ユーザー作成が完了する' do
        user = User.create(
                        email: Faker::Internet.email,
                        password: "test01",
                        admin: false
        )
        user_detail = UserDetail.create(
                                      account_name: 'ゲストユーザー',
                                      self_introduction: 'ゲストユーザーです。',
                                      living_country: "US",
                                      native_country: "JP",
                                      date_of_birth: Faker::Date.birthday(min_age: 20, max_age: 60),
                                      gender: rand(3),
                                      user_id: user.id
        )
        learn_language = LearnLanguage.create(
                                            learn_language: "English",
                                            rank: rand(3),
                                            user_id: user.id
        )
        speak_language = SpeakLanguage.create(
                                            speak_language: "Japanese",
                                            rank: "ネイティブ",
                                            user_id: user.id
        )
        game_account = GameAccount.create(
                                        discord_id: 'user#0001',
                                        twitter_id: "@user01",
                                        user_id: user.id
        )
        game = Game.create(
                                        name: 'Minecraft',
                                        user_id: user.id
        )
        game_platform = GamePlatform.create(name: "PlayStation" )
        game_relation = GameRelation.create(
                                          game_id: game.id,
                                          game_platform_id: game_platform.id
        )
        # expect -> 求める結果… .to => ~は  be_valid => 有効か
        expect(user).to be_valid
        expect(user_detail).to be_valid
        expect(learn_language).to be_valid
        expect(speak_language).to be_valid
        expect(game_account).to be_valid
        expect(game).to be_valid
        expect(game_platform).to be_valid
        expect(game_relation).to be_valid
      end
    end
    context 'emailに異常値を入れた場合' do
      it 'ユーザー作成が失敗する' do
        user = User.create(
                        email: "",
                        password: "test01",
                        admin: false
        )
        expect(user).not_to be_valid
      end
    end
    context 'passwordに異常値を入れた場合' do
      it 'ユーザー作成が失敗する' do
        user = User.create(
                        email: Faker::Internet.email,
                        password: "aa",
                        admin: false
        )
        expect(user).not_to be_valid
      end
    end
    context 'account_nameに異常値を入れた場合' do
      it 'user_detailの作成が失敗する' do
        user_detail = UserDetail.create(
                                      account_name: '',
                                      self_introduction: 'ゲストユーザーです。',
                                      living_country: "US",
                                      native_country: "JP",
                                      date_of_birth: Faker::Date.birthday(min_age: 20, max_age: 60),
                                      gender: rand(3),
                                      user_id: User.first.id
        )
        expect(user_detail).not_to be_valid
      end
    end
  end
end
