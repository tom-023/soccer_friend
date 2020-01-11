require 'rails_helper'

RSpec.describe 'ユーザーログイン管理', type: :system do

  before do
    FactoryBot.create(:user)
    FactoryBot.create(:second_user)
  end

  # describe "ユーザー登録画面" do
  #   # sign_up_with("test@example.com", "password", "password")
  #
  #   it 'visitor can sign up with valid email and password' do
  #     visit new_user_registration_path
  #     fill_in "名前", with: 'テスト３'
  #     fill_in "メールアドレス", with: 'test3@gmail.com'
  #     select 'モンテディオ山形', from: 'support_team'
  #     fill_in "サポーター歴", with: '3'
  #     fill_in "自己紹介", with: 'よろしくお願いします。'
  #     fill_in "パスワード", with: 'password1'
  #     fill_in "パスワード確認", with: 'password1'
  #     click_button "登録"
  #     expect(page).to have_content("エラー")
  #   end
  # end

  describe 'ユーザーログイン画面' do
    context '必要項目を入力してログインボタンを押した場合' do
      it 'メールアドレス、パスワードが登録済のユーザーはログインできる' do
        visit new_user_session_path
        fill_in 'メールアドレス', with: 'test1@gmail.com'
        fill_in 'パスワード', with: 'password1'
        click_button "ログイン"
        expect(current_path).to eq(root_path)
      end
    end

    context '入力誤りがある状態で実行ボタンを押した場合' do
      it 'メールアドレスに誤りがあればログインできない' do
        visit new_user_session_path
        fill_in 'メールアドレス', with: 'test100000@gmail.com'
        fill_in 'パスワード', with: 'password1'
        click_button "ログイン"
        expect(current_path).not_to eq(root_path)
      end

      it 'パスワードに誤りがあればログインできない' do
        visit new_user_session_path
        fill_in 'メールアドレス', with: 'test1@gmail.com'
        fill_in 'パスワード', with: 'password1000000'
        click_button "ログイン"
        expect(current_path).not_to eq(root_path)
      end
    end
  end

  describe 'ユーザー登録画面' do
    it 'ログイン時は、ユーザー登録画面に行けない' do
      visit new_user_session_path
      fill_in 'メールアドレス', with: 'test1@gmail.com'
      fill_in 'パスワード', with: 'password1'
      click_button "ログイン"
      visit new_user_registration_path
      expect(current_path).to eq(root_path)
    end
  end

  describe 'ユーザー詳細画面' do
    it '他のユーザー詳細画面に行ける' do
      visit new_user_session_path
      fill_in 'メールアドレス', with: 'test1@gmail.com'
      fill_in 'パスワード', with: 'password1'
      click_button "ログイン"
      visit user_path(2)
      expect(current_path).to eq(user_path(2))
    end
  end

  describe 'ユーザー管理画面' do
    it '管理者がアクセスできる' do
      visit new_user_session_path
      fill_in 'メールアドレス', with: 'test1@gmail.com'
      fill_in 'パスワード', with: 'password1'
      click_button "ログイン"
      visit '/admin'
      expect(current_path).to eq('/admin')
    end
  end


end
