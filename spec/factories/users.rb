FactoryBot.define do
  factory :user do
    id { 1 }
    name { 'ユーザー名前１' }
    email { 'test1@gmail.com' }
    support_team { 'モンテディオ山形' }
    support_history { 'テスト１' }
    introduce { 'よろしくお願いします。' }
    password { 'password1' }
    password_confirmation { 'password1' }
    confirmed_at { Date.today }
    admin { 'true' }
  end

  factory :second_user, class: User do
    id { 2 }
    name { 'ユーザー名前２' }
    email { 'test2@gmail.com' }
    support_team { 'ベガルタ仙台' }
    support_history { 'テスト２' }
    introduce { 'よろしくお願いします。' }
    password { 'password2' }
    password_confirmation { 'password2' }
    confirmed_at { Date.today }
  end
end
