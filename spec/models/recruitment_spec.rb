# bundle exec rspec spec/models/recruitment_spec.rb

require 'rails_helper'
describe '募集投稿機能', type: :model do
  before do
    FactoryBot.create(:user)
  end
end
