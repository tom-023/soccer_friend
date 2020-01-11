require 'rails_helper'

RSpec.describe 'ユーザー管理', type: :model do

  before do
    FactoryBot.create(:user)
  end

  it '名前が空ならバリデーションが通らない' do
    user = User.new(name: '',
                    email: 'test@gmail.com',
                    password: 'password1',
                    password_confirmation: 'password1')
    expect(user).not_to be_valid
  end

  it 'メールアドレスが空ならバリデーションが通らない' do
    user = User.new(name: '失敗テスト',
                    email: '',
                    password: 'password1',
                    password_confirmation: 'password1')
    expect(user).not_to be_valid
  end

  it 'メールアドレスが重複したらバリデーションが通らない' do
    user = User.new(name: '失敗テスト',
                    email: 'test1@gmail.com',
                    password: 'password1',
                    password_confirmation: 'password1')
    expect(user).not_to be_valid
  end

  it 'メールアドレスがメール形式ではないならバリデーションが通らない' do
    user = User.new(name: '失敗テスト',
                    email: 'あああああ',
                    password: 'password1',
                    password_confirmation: 'password1')
    expect(user).not_to be_valid
  end

  it 'メールアドレスが大文字でもバリデーションを通る' do
    user = User.new(name: '失敗テスト',
                    email: 'TEST@GMAIL.COM',
                    password: 'password1',
                    password_confirmation: 'password1')
    expect(user).to be_valid
  end

  it 'パスワードが空ならバリデーションが通らない' do
    user = User.new(name: '失敗テスト',
                    email: 'test@gmail.com',
                    password: '',
                    password_confirmation: '')
    expect(user).not_to be_valid
  end

  it 'パスワードが6文字以内ならバリデーションが通らない' do
    user = User.new(name: '失敗テスト',
                    email: 'test@gmail.com',
                    password: '11111',
                    password_confirmation: '11111')
    expect(user).not_to be_valid
  end

  it 'パスワードが確認と一致しないならバリデーションが通らない' do
    user = User.new(name: '失敗テスト',
                    email: 'test@gmail.com',
                    password: '111111',
                    password_confirmation: '222222')
    expect(user).not_to be_valid
  end

end
