require 'rails_helper'
RSpec.describe 'ユーザー管理機能', type: :system do
  describe 'ユーザ登録のテスト' do
    context 'ユーザの新規登録ができること' do
      it 'ユーザーが新規登録される' do
        visit new_user_registration_path
        fill_in 'name', with: 'create_user_test'
        fill_in 'email', with: 'create_user_test@gmail.com'
        fill_in 'password', with: 'create+A'
        fill_in 'password_confirmation', with: 'create+A'
        click_on '送信'
        user = User.select(:email)
        expect(user[0].email).to eq "create_user_test@gmail.com"
