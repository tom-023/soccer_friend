FactoryBot.define do
  factory :event do
    id { 1 }
    title { '名前テスト１' }
    day { '2019-12-27' }
    place { 'スタジアム１' }
    cheering_team { 'モンテディオ山形' }
    content { 'テスト１' }
    association :organizer, factory: :user
  end

  # 存在しないクラス名の名前(second_task)をつける場合、
  # オプションで「このクラスのテストデータにしてください」と指定する
  factory :second_event, class: Event do
    id { 2 }
    title { '名前テスト２' }
    day { '2019-12-27' }
    place { 'スタジアム２' }
    cheering_team { 'モンテディオ山形' }
    content { 'テスト２' }
    association :organizer, factory: :second_user
  end
end
