# bundle exec rspec spec/system/user_spec.rb

require 'rails_helper'
RSpec.describe 'ユーザー機能', type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:user_detail) { FactoryBot.create(:user_detail) }
  let!(:user_learn_language) { FactoryBot.create(:user_learn_language) }
  let!(:user_speak_language) { FactoryBot.create(:user_speak_language) }
  let!(:user_game_account) { FactoryBot.create(:user_game_account) }
  let!(:user_game) { FactoryBot.create(:user_game) }
  let!(:user_game_relation) { FactoryBot.create(:user_game_relation) }
  before do
    @user = User.find_by(email: "rspec_user@sample.com")
    @user_detail = UserDetail.find_by(user_id: @user.id)
    @user_learn_language = LearnLanguage.find_by(user_id: @user.id)
    @user_speak_language = SpeakLanguage.find_by(user_id: @user.id)
    @user_game_account = GameAccount.find_by(user_id: @user.id)
    @user_game = Game.find_by(user_id: @user.id)
  end
  describe 'ユーザ登録のテスト' do
    context '各フォームに正常値を入れる' do
      it 'ユーザーが新規登録される' do
        visit new_user_registration_path
        fill_in 'user_email', with: 'test@sample.com'
        fill_in 'user_password', with: '1234567+A'
        fill_in 'user_password_confirmation', with: '1234567+A'
        fill_in 'user_user_detail_attributes_account_name', with: 'rspec'
        select '日本', from: 'user_user_detail_attributes_living_country'
        select '米国', from: 'user_user_detail_attributes_native_country'
        select '1990', from: 'user[user_detail_attributes][date_of_birth(1i)]'
          select '1', from: 'user[user_detail_attributes][date_of_birth(2i)]'
          select '10', from: 'user[user_detail_attributes][date_of_birth(3i)]'
        select '男性', from: 'user[user_detail_attributes][gender]'
        fill_in 'user_user_detail_attributes_self_introduction', with: '自己紹介文の記入'
        select 'English', from: 'user[learn_languages_attributes][0][learn_language]'
          select '初級者', from: 'user[learn_languages_attributes][0][rank]'
        select 'English', from: 'user[speak_languages_attributes][0][speak_language]'
          select '初級者', from: 'user[speak_languages_attributes][0][rank]'
        fill_in 'user_games_attributes_0_name', with: 'Minecraft'
        select 'PlayStation', from: 'user[games_attributes][0][game_relations_attributes][0][game_platform_id]'
        fill_in 'user_game_account_attributes_discord_id', with: 'test#5555'
        fill_in 'user_game_account_attributes_twitter_id', with: '@test5555'
        click_on 'アカウント作成'
        expect(page).to have_content 'アカウント登録が完了しました。'
      end
    end
    context 'フォームに異常値を入れる' do
      it 'ユーザーの新規作成が失敗する' do
        visit new_user_registration_path
        fill_in 'user_email', with: '0001'
        fill_in 'user_password', with: '1234567+A'
        fill_in 'user_password_confirmation', with: '1234567+A'
        fill_in 'user_user_detail_attributes_account_name', with: 'rspec'
        select '日本', from: 'user_user_detail_attributes_living_country'
        select '米国', from: 'user_user_detail_attributes_native_country'
        select '1990', from: 'user[user_detail_attributes][date_of_birth(1i)]'
          select '1', from: 'user[user_detail_attributes][date_of_birth(2i)]'
          select '10', from: 'user[user_detail_attributes][date_of_birth(3i)]'
        select '男性', from: 'user[user_detail_attributes][gender]'
        fill_in 'user_user_detail_attributes_self_introduction', with: '自己紹介文の記入'
        select 'English', from: 'user[learn_languages_attributes][0][learn_language]'
          select '初級者', from: 'user[learn_languages_attributes][0][rank]'
        select 'English', from: 'user[speak_languages_attributes][0][speak_language]'
          select '初級者', from: 'user[speak_languages_attributes][0][rank]'
        fill_in 'user_games_attributes_0_name', with: 'Minecraft'
        select 'PlayStation', from: 'user[games_attributes][0][game_relations_attributes][0][game_platform_id]'
        fill_in 'user_game_account_attributes_discord_id', with: 'test#5555'
        fill_in 'user_game_account_attributes_twitter_id', with: '@test5555'
        click_on 'アカウント作成'
        expect(page).not_to have_content 'アカウント登録が完了しました。'
      end
    end
  end
  describe 'ログイン機能テスト' do
    context '各フォームに正常値を入れる' do
      it 'ログインが出来る' do
        visit new_user_session_path
        fill_in 'user_email', with: "rspec_user@sample.com"
        fill_in 'user_password', with: '1234567+A'
        click_button "ログイン"
        expect(page).to have_content 'ログインしました。'
      end
    end
    context 'フォームに異常値を入れる' do
      it 'ログインが失敗する' do
        visit new_user_session_path
        fill_in 'user_email', with: "rspec_user@sample.com"
        fill_in 'user_password', with: '111111'
        click_on "ログイン"
        expect(page).to have_content "メールアドレスまたはパスワードが違います。"
      end
    end
  end
  describe 'ログアウト機能テスト' do
    context '各フォームに正常値を入れる' do
      it 'ログアウトが出来る' do
        visit new_user_session_path
        fill_in 'user_email', with: "rspec_user@sample.com"
        fill_in 'user_password', with: '1234567+A'
        click_on "ログイン"
        click_on "ログアウト"
        expect(page).to have_content "Langamer とは…"
      end
    end
  end
  describe 'ユーザー情報編集機能テスト' do
    context '各フォームに正常値を入れる' do
      it 'ユーザー情報を更新出来る' do
        visit new_user_session_path
        fill_in 'user_email', with: "rspec_user@sample.com"
        fill_in 'user_password', with: '1234567+A'
        click_on "ログイン"
        click_on "my-page"
        click_on "プロフィールの編集"
        fill_in 'user_user_detail_attributes_self_introduction', with: '自己紹介を編集します。'
        click_on "更新"
        expect(page).to have_content "自己紹介を編集します。"
      end
    end
    context '各フォームに異常値を入れる' do
      it 'ユーザー情報の更新に失敗する' do
        visit new_user_session_path
        fill_in 'user_email', with: "rspec_user@sample.com"
        fill_in 'user_password', with: '1234567+A'
        click_on "ログイン"
        click_on "my-page"
        click_on "プロフィールの編集"
        fill_in 'user_user_detail_attributes_account_name', with: ''
        click_on "更新"
        expect(page).to have_content "アカウント名を入力してください。"
      end
    end
  end
    describe 'ユーザー削除機能テスト' do
    context 'アカウントの削除ボタンを押す' do
      it 'ユーザーが削除される' do
        visit new_user_session_path
        fill_in 'user_email', with: "rspec_user@sample.com"
        fill_in 'user_password', with: '1234567+A'
        click_on "ログイン"
        click_on "my-page"
        click_on "プロフィールの編集"
        click_on "アカウントの削除"
        page.accept_confirm '本当にアカウントを削除しますか？'
        expect(page).to have_content "Langamer とは…"
      end
    end
  end
end
