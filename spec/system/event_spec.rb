require 'rails_helper'

RSpec.describe 'イベント募集機能', type: :system do

  before do
    FactoryBot.create(:event)
    FactoryBot.create(:second_event)
    FactoryBot.create(:tag)
    @events = Event.all.order(created_at: :desc)
    visit new_user_session_path
    fill_in 'メールアドレス', with: 'test1@gmail.com'
    fill_in 'パスワード', with: 'password1'

    click_button "ログイン"
  end

  describe 'イベント登録画面' do
    context '必要項目を入力して実行ボタンを押した場合' do
      it 'データが保存されること' do
        visit new_event_path
        fill_in 'タイトル',    with: 'タイトル３'
        fill_in 'スタジアム', with: 'スタジアム３'
        select 'モンテディオ山形', from: '応援チーム'
        fill_in '内容', with: 'テスト３'
        click_button "確認"
        click_button "登録"
        page.html
        expect(page).to have_content 'タイトル３'
      end
    end

    context '入力誤りがある状態で実行ボタンを押した場合' do
      it 'タイトルが空欄の場合、エラーが出る' do
        visit new_event_path
        fill_in 'タイトル',    with: ''
        fill_in 'スタジアム', with: 'スタジアム３'
        select 'モンテディオ山形', from: '応援チーム'
        fill_in '内容', with: 'テスト３'
        click_button "確認"
        expect(page).to have_content 'エラー'
      end

      it 'スタジアムが空欄の場合、エラーが出る' do
        visit new_event_path
        fill_in 'タイトル',    with: 'タイトル３'
        fill_in 'スタジアム', with: ''
        select 'モンテディオ山形', from: '応援チーム'
        fill_in '内容', with: 'テスト３'
        click_button "確認"
        expect(page).to have_content 'エラー'
      end

      it '応援チームが空欄の場合、エラーが出る' do
        visit new_event_path
        fill_in 'タイトル',    with: 'タイトル３'
        fill_in 'スタジアム', with: 'スタジアム３'
        fill_in '内容', with: 'テスト３'
        click_button "確認"
        expect(page).to have_content 'エラー'
      end

      it '内容が空欄の場合、エラーが出る' do
        visit new_event_path
        fill_in 'タイトル',    with: 'タイトル３'
        fill_in 'スタジアム', with: 'スタジアム３'
        select 'モンテディオ山形', from: '応援チーム'
        fill_in '内容', with: ''
        click_button "確認"
        expect(page).to have_content 'エラー'
      end
    end
  end

  describe 'イベント一覧画面' do
    context '複数のイベントを作成した場合' do
      it 'イベントの順番が作成日時の降順で表示されること' do
        visit events_path
        expect(Event.order("created_at DESC").map(&:id)).to eq [2,1]
      end
    end

    context '初心者歓迎ボタンを押した場合' do
      it '初心者歓迎タグのイベントが反映される' do
        visit new_event_path
        fill_in 'タイトル',    with: 'タイトル３'
        fill_in 'スタジアム', with: 'スタジアム３'
        select '浦和レッズ', from: '応援チーム'
        fill_in '内容', with: 'テスト３'
        check 'event[tag_ids][]'
        click_button "確認"
        click_button "登録"
        visit events_path
        find(".begginer").click
        page.html
        expect(page).not_to have_content 'タイトル１'
        expect(page).not_to have_content 'タイトル２'
        expect(page).to have_content 'タイトル３'
      end
    end

    context 'チーム検索ボタンを押した場合' do
      it '浦和レッズのイベントのみ表示される' do
        visit new_event_path
        fill_in 'タイトル',    with: 'タイトル３'
        fill_in 'スタジアム', with: 'スタジアム３'
        select '浦和レッズ', from: '応援チーム'
        fill_in '内容', with: 'テスト３'
        check 'event[tag_ids][]'
        click_button "確認"
        click_button "登録"
        visit events_path
        select '浦和レッズ', from: 'cheering_team'
        click_button "チーム名で検索"
        expect(Event.order("created_at DESC").map(&:id)).not_to eq [2,1]
        page.html
        expect(page).to have_content 'タイトル３'
      end
    end
  end

  describe 'イベント詳細画面' do
     context '任意のイベント詳細画面に遷移した場合' do
       it '該当イベントの内容が表示されたページに遷移すること' do
         visit events_path
         all('.card-link')[0].click_link '詳細'
         expect(current_path).to eq(event_path(2))
       end
     end

     context '任意のイベントに参加した場合' do
       it '参加者一覧に自分の名前が記載される' do
         visit events_path
         all('.card-link')[0].click_link '詳細'
         click_on "参加する"
         all('.card-link')[0].click_link '詳細'
         expect(page).to have_content 'ユーザー名前１'
       end
     end

     context '任意のイベントをキャンセル場合' do
       it '参加者一覧に自分の名前が削除される' do
         visit events_path
         all('.card-link')[0].click_link '詳細'
         click_on "参加する"
         all('.card-link')[0].click_link '詳細'
         click_on "キャンセル"
         all('.card-link')[0].click_link '詳細'
         expect(page).not_to have_content 'ユーザー名前１'
       end
     end
  end

end
