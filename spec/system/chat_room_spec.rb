require 'rails_helper'
RSpec.describe '募集投稿機能', type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:user_detail) { FactoryBot.create(:user_detail) }
  let!(:user_learn_language) { FactoryBot.create(:user_learn_language) }
  let!(:user_speak_language) { FactoryBot.create(:user_speak_language) }
  let!(:user_game_account) { FactoryBot.create(:user_game_account) }
  let!(:user_game) { FactoryBot.create(:user_game) }
  let!(:user_game_relation) { FactoryBot.create(:user_game_relation) }
  let!(:admin) { FactoryBot.create(:user) }
  let!(:admin_detail) { FactoryBot.create(:user_detail) }
  let!(:admin_learn_language) { FactoryBot.create(:user_learn_language) }
  let!(:admin_speak_language) { FactoryBot.create(:user_speak_language) }
  let!(:admin_game_account) { FactoryBot.create(:user_game_account) }
  let!(:admin_game) { FactoryBot.create(:user_game) }
  let!(:admin_game_relation) { FactoryBot.create(:user_game_relation) }
  let!(:admin_recruitment) { FactoryBot.create(:admin_recruitment) }
  let!(:user_recruitment) { FactoryBot.create(:user_recruitment) }
end
