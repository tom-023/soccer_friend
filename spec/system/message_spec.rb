require 'rails_helper'

RSpec.describe 'イベント募集機能', type: :system do

  before do
    FactoryBot.create(:user)
    FactoryBot.create(:second_user)
    visit new_user_session_path
    fill_in 'メールアドレス', with: 'test1@gmail.com'
    fill_in 'パスワード', with: 'password1'
    click_button "ログイン"
  end

  describe 'メッセージ画面' do
    context 'コメントを入力して送信ボタンを押した場合' do
      it '未読メッセージが表示される' do
        visit user_path(2)
        click_link "メッセージを送る"
        fill_in 'message_text', with: 'テストです！'
        click_button "メッセージを送る"
        expect(page).to have_content 'テストです！'
        expect(page).to have_content '未読'
      end
    end

    context '相手からメッセージが送られた場合' do
      it '相手のメッセージが表示される' do
        visit user_path(2)
        click_link "メッセージを送る"
        fill_in 'message_text', with: 'テストです！'
        click_button "メッセージを送る"
        click_link "ログアウト"
        visit new_user_session_path
        fill_in 'メールアドレス', with: 'test2@gmail.com'
        fill_in 'パスワード', with: 'password2'
        click_button "ログイン"
        visit user_path(1)
        click_link "メッセージを送る"
        expect(page).to have_content 'テストです！'
      end
    end

    context '相手がメッセージを読んだ場合' do
      it '既読が表示される' do
        visit user_path(2)
        click_link "メッセージを送る"
        fill_in 'message_text', with: 'テストです！'
        click_button "メッセージを送る"
        click_link "ログアウト"
        visit new_user_session_path
        fill_in 'メールアドレス', with: 'test2@gmail.com'
        fill_in 'パスワード', with: 'password2'
        click_button "ログイン"
        visit user_path(1)
        click_link "メッセージを送る"
        click_link "ログアウト"
        visit new_user_session_path
        fill_in 'メールアドレス', with: 'test1@gmail.com'
        fill_in 'パスワード', with: 'password1'
        click_button "ログイン"
        visit user_path(2)
        click_link "メッセージを送る"
        expect(page).to have_content '既読'
      end
    end
  end
end
