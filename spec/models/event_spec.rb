require 'rails_helper'

RSpec.describe 'タスク管理', type: :model do
  before do
    @user = FactoryBot.create(:user)
  end

  it 'titleが空ならバリデーションが通らない' do
    user = @user
    event = user.events.build(title: '',
                              day: '2019-12-27',
                              place: 'スタジアム',
                              cheering_team: 'モンテディオ山形',
                              content: 'テスト')
    expect(event).not_to be_valid
  end

  it 'contentが空ならバリデーションが通らない' do
    user = @user
    event = user.events.build(title: 'テスト',
                              day: '2019-12-02',
                              place: 'スタジアム',
                              cheering_team: 'モンテディオ山形',
                              content: '')
    expect(event).not_to be_valid
  end

  it 'placeが空ならバリデーションが通らない' do
    user = @user
    event = user.events.build(title: 'テスト',
                              day: '2019-12-02',
                              place: '',
                              cheering_team: 'モンテディオ山形',
                              content: 'テスト')
    expect(event).not_to be_valid
  end

  it 'cheering_teamが空ならバリデーションが通らない' do
    user = @user
    event = user.events.build(title: 'テスト',
                              day: '2019-12-02',
                              place: 'スタジアム',
                              cheering_team: '',
                              content: 'テスト')
    expect(event).not_to be_valid
  end

  it '全ての内容が記載されていればバリデーションが通る' do
    user = @user
    event = user.events.build(title: 'テスト',
                              day: '2019-12-02',
                              place: 'スタジアム',
                              cheering_team: 'モンテディオ山形',
                              content: 'テスト')
    expect(event).to be_valid
  end
end
