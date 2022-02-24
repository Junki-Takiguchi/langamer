require 'rails_helper'
RSpec.describe 'フレンド機能', type: :system do
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
  let!(:admin_recruitment) { FactoryBot.create(:admin_recruitment) }
  let!(:user_recruitment) { FactoryBot.create(:user_recruitment) }
  describe 'フレンド申請テスト' do
    context 'フレンド申請ボタンを押す' do
      it 'フレンド申請が行える' do
        visit new_user_session_path
        fill_in 'user_email', with: "rspec_user@sample.com"
        fill_in 'user_password', with: '1234567+A'
        click_on "ログイン"
        fill_in 'q_title_or_content_or_user_games_name_or_user_user_detail_self_introduction_cont', with: "admin-post"
        click_on "検索"
        click_on "recruit"
        click_on "フレンド申請"
        expect(page).to have_button "申請をキャンセル"
      end
    end
    context '申請をキャンセルボタンを押す' do
      let!(:admin_recruitment) { FactoryBot.create(:admin_recruitment) }
      it 'フレンド申請をキャンセルする' do
        visit new_user_session_path
        fill_in 'user_email', with: "rspec_user@sample.com"
        fill_in 'user_password', with: '1234567+A'
        click_on "ログイン"
        fill_in 'q_title_or_content_or_user_games_name_or_user_user_detail_self_introduction_cont', with: "admin-post"
        click_on "検索"
        click_on "recruit"
        click_on "フレンド申請"
        click_on "申請をキャンセル"
        page.accept_confirm '申請をキャンセルしますか？'
        expect(page).to have_button "フレンド申請"
      end
    end
    context '申請を許可ボタンを押す' do
      let!(:user02) { FactoryBot.create(:user02) }
      let!(:user_detail02) { FactoryBot.create(:user_detail02) }
      let!(:target02) { FactoryBot.create(:target02) }
      it 'フレンドになる' do
        visit new_user_session_path
        fill_in 'user_email', with: "rspec_user@sample.com"
        fill_in 'user_password', with: '1234567+A'
        click_on "ログイン"
        click_on "receive-friend-request"
        click_on "申請を許可"
        expect(page).to have_content "rspec_user02"
      end
    end
    context '申請を却下ボタンを押す' do
      let!(:target) { FactoryBot.create(:target) }
      it 'フレンド申請が却下される' do
        visit new_user_session_path
        fill_in 'user_email', with: "rspec_user@sample.com"
        fill_in 'user_password', with: '1234567+A'
        click_on "ログイン"
        click_on "receive-friend-request"
        click_on "申請を却下"
        page.accept_confirm '申請を却下します。よろしいですか？'
        click_on "message-list"
        expect(page).not_to have_content "rspec_admin"
      end
    end
  end
end
