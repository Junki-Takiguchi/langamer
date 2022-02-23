require 'rails_helper'
RSpec.describe '募集投稿機能', type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:user_detail) { FactoryBot.create(:user_detail) }
  let!(:user_learn_language) { FactoryBot.create(:user_learn_language) }
  let!(:user_speak_language) { FactoryBot.create(:user_speak_language) }
  let!(:user_game_account) { FactoryBot.create(:user_game_account) }
  let!(:user_game) { FactoryBot.create(:user_game) }
  let!(:user_game_relation) { FactoryBot.create(:user_game_relation) }
  let!(:admin) { FactoryBot.create(:admin) }
  let!(:admin_detail) { FactoryBot.create(:admin_detail) }
  let!(:admin_learn_language) { FactoryBot.create(:admin_learn_language) }
  let!(:admin_speak_language) { FactoryBot.create(:admin_speak_language) }
  let!(:admin_game_account) { FactoryBot.create(:admin_game_account) }
  let!(:admin_game) { FactoryBot.create(:admin_game) }
  let!(:admin_game_relation) { FactoryBot.create(:admin_game_relation) }
  before do
    @user = User.find_by(email: "rspec_user@sample.com")
    @user_detail = UserDetail.find_by(user_id: @user.id)
    @user_learn_language = LearnLanguage.find_by(user_id: @user.id)
    @user_speak_language = SpeakLanguage.find_by(user_id: @user.id)
    @user_game_account = GameAccount.find_by(user_id: @user.id)
    @user_game = Game.find_by(user_id: @user.id)
  end
  describe '募集投稿テスト' do
    context '各フォームに正常値を入れる' do
      it '募集投稿が登録される' do
        visit new_user_session_path
        fill_in 'user_email', with: "rspec_user@sample.com"
        fill_in 'user_password', with: '1234567+A'
        click_on "ログイン"
        click_on "新しく募集を作成する"
        fill_in 'recruitment_title', with: "rspec-test-title"
        fill_in 'recruitment_content', with: 'rspec-test-content'
        click_on "登録する"
        expect(page).to have_content "募集文を投稿しました。"
      end
    end
    context '各フォームに異常値を入れる' do
      it '募集投稿の投稿が失敗する' do
        visit new_user_session_path
        fill_in 'user_email', with: "rspec_user@sample.com"
        fill_in 'user_password', with: '1234567+A'
        click_on "ログイン"
        click_on "新しく募集を作成する"
        fill_in 'recruitment_title', with: ""
        fill_in 'recruitment_content', with: ''
        click_on "登録する"
        expect(page).to have_content "タイトルを入力してください"
        expect(page).to have_content "募集本文を入力してください"
      end
    end
  end
  describe '募集投稿の編集テスト' do
    context '各フォームに正常値を入れる' do
      it '募集投稿が編集される' do
        visit new_user_session_path
        fill_in 'user_email', with: "rspec_user@sample.com"
        fill_in 'user_password', with: '1234567+A'
        click_on "ログイン"
        click_on "新しく募集を作成する"
        fill_in 'recruitment_title', with: "rspec-test-title"
        fill_in 'recruitment_content', with: 'rspec-test-content'
        click_on "登録する"
        click_on "my-page"
        click_on "history-recruitment"
        click_on "投稿編集"
        fill_in 'recruitment_title', with: "after-edit"
        fill_in 'recruitment_content', with: 'after-content'
        click_on "登録する"
        expect(page).to have_content "after-edit"
        expect(page).to have_content "after-content"
      end
    end
    context '各フォームに異常値を入れる' do
      it '募集投稿の編集が失敗する' do
        visit new_user_session_path
        fill_in 'user_email', with: "rspec_user@sample.com"
        fill_in 'user_password', with: '1234567+A'
        click_on "ログイン"
        click_on "新しく募集を作成する"
        fill_in 'recruitment_title', with: "rspec-test-title"
        fill_in 'recruitment_content', with: 'rspec-test-content'
        click_on "登録する"
        click_on "my-page"
        click_on "history-recruitment"
        click_on "投稿編集"
        fill_in 'recruitment_title', with: ""
        fill_in 'recruitment_content', with: ''
        click_on "登録する"
        expect(page).to have_content "タイトルを入力してください"
        expect(page).to have_content "募集本文を入力してください"
      end
    end
  end
  describe '募集投稿の削除テスト' do
    context '投稿削除ボタンを押す' do
      it '投稿が削除される' do
        visit new_user_session_path
        fill_in 'user_email', with: "rspec_user@sample.com"
        fill_in 'user_password', with: '1234567+A'
        click_on "ログイン"
        click_on "新しく募集を作成する"
        fill_in 'recruitment_title', with: "rspec-test-title"
        fill_in 'recruitment_content', with: 'rspec-test-content'
        click_on "登録する"
        click_on "my-page"
        click_on "history-recruitment"
        click_on "投稿削除"
        page.accept_confirm '本当に削除しますか？'
        expect(page).to have_content "投稿を削除しました。"
      end
    end
  end
  describe '投稿の検索機能テスト' do
    context '正常値でキーワード検索を行う' do
      let!(:admin_recruitment) { FactoryBot.create(:admin_recruitment) }
      let!(:user_recruitment) { FactoryBot.create(:user_recruitment) }
      it 'キーワードにあった検索結果が表示される' do
        visit new_user_session_path
        fill_in 'user_email', with: "rspec_user@sample.com"
        fill_in 'user_password', with: '1234567+A'
        click_on "ログイン"
        fill_in 'q_title_or_content_or_user_games_name_or_user_user_detail_self_introduction_cont', with: "admin-post"
        click_on "検索"
        expect(page).to have_content "admin-post"
      end
    end
    context '異常値でキーワード検索を行う' do
      let!(:admin_recruitment) { FactoryBot.create(:admin_recruitment) }
      let!(:user_recruitment) { FactoryBot.create(:user_recruitment) }
      it 'キーワード検索結果が表示されない' do
        visit new_user_session_path
        fill_in 'user_email', with: "rspec_user@sample.com"
        fill_in 'user_password', with: '1234567+A'
        click_on "ログイン"
        fill_in 'q_title_or_content_or_user_games_name_or_user_user_detail_self_introduction_cont', with: "aaa"
        click_on "検索"
        expect(page).not_to have_content "admin-post"
      end
    end
    context '正常値で選択検索を行う' do
      let!(:admin_recruitment) { FactoryBot.create(:admin_recruitment) }
      let!(:user_recruitment) { FactoryBot.create(:user_recruitment) }
      it '検索結果が表示される' do
        visit new_user_session_path
        fill_in 'user_email', with: "rspec_user@sample.com"
        fill_in 'user_password', with: '1234567+A'
        click_on "ログイン"
        select 'PlayStation', from: 'q_user_games_game_relations_game_platform_name_eq'
        select 'Japanese', from: 'q_user_learn_languages_learn_language_eq'
        select 'English', from: 'q_user_speak_languages_speak_language_eq'
        click_on "検索"
        expect(page).to have_content "admin-post"
      end
    end
    context '異常値で選択検索を行う' do
      let!(:admin_recruitment) { FactoryBot.create(:admin_recruitment) }
      let!(:user_recruitment) { FactoryBot.create(:user_recruitment) }
      it '検索結果が表示されない' do
        visit new_user_session_path
        fill_in 'user_email', with: "rspec_user@sample.com"
        fill_in 'user_password', with: '1234567+A'
        click_on "ログイン"
        select 'PC', from: 'q_user_games_game_relations_game_platform_name_eq'
        select 'Japanese', from: 'q_user_learn_languages_learn_language_eq'
        select 'English', from: 'q_user_speak_languages_speak_language_eq'
        click_on "検索"
        expect(page).not_to have_content "admin-post"
      end
    end
  end
end
