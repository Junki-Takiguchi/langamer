# bundle exec rspec spec/models/chat_room_spec.rb
require 'rails_helper'

describe 'チャット機能', type: :model do
  before do
    FactoryBot.create(:user)
  end
end
