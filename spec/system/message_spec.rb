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
  describe 'チャットメッセージ送信機能' do
    context 'コメントを送信する' do
      let!(:friend) { FactoryBot.create(:friend) }
      let!(:chat_room) { FactoryBot.create(:chat_room) }
      let!(:admin_participant) { FactoryBot.create(:admin_participant) }
      let!(:user_participant) { FactoryBot.create(:user_participant) }
      it 'コメントが非同期処理で送信される' do
        visit new_user_session_path
        fill_in 'user_email', with: "rspec_user@sample.com"
        fill_in 'user_password', with: '1234567+A'
        click_on "ログイン"
        click_on "message-list"
        click_on "message-box"
        fill_in 'message_message', with: 'send_message'
        click_on "送信"
        expect(page).to have_content "send_message"
      end
    end
  end
end
