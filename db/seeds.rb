# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


name = "テストユーザー"
email = "test@g.com"
support_team = "浦和レッズ"
support_history = "1"
password = "111111"
admin = "true"
User.create!(name: name,
             email: email,
             support_team: support_team,
             support_history: support_history,
             password: password,
             password_confirmation: password,
             admin: true
            )

20.times do |n|
  User.create!(name: "テスト君#{n+1}",
               email: "testmail#{n+1}@g.com",
               support_team: "FC東京",
               support_history: 5,
               password: 111111,
               password_confirmation: 111111,
              )
end


10.times do |i|
  Event.create!(organizer_id: User.find(i+1).id,
                title: "募集#{i+1}",
                day: '2019-01-01',
                place: "スタジアム#{i+1}",
                content: "内容#{i+1}",
                cheering_team: "セレッソ大阪"
               )
end

10.times do |i|
  Event.create!(organizer_id: User.find(i+10).id,
                title: "募集#{i+10}",
                day: '2019-01-01',
                place: "スタジアム#{i+10}",
                content: "内容#{i+10}",
                cheering_team: "ベガルタ仙台"
               )
end


title = "初心者歓迎"
Tag.create!(title: title)

title = "少人数"
Tag.create!(title: title)

title = "女性限定"
Tag.create!(title: title)

title = "ゆる〜く活動"
Tag.create!(title: title)

title = "年齢不問"
Tag.create!(title: title)


4.times do |i|
  Tagging.create!(event_id: Event.find(i+1).id,
                  tag_id: 1,
                 )
end

4.times do |i|
  Tagging.create!(event_id: Event.find(i+6).id,
                  tag_id: 2,
                 )
end

4.times do |i|
  Tagging.create!(event_id: Event.find(i+10).id,
                  tag_id: 3
                 )
end


ParticipantManagement.create!(event_id: 20,
                              participant_id: 1
                             )

ParticipantManagement.create!(event_id: 19,
                              participant_id: 2
                             )
ParticipantManagement.create!(event_id: 19,
                              participant_id: 3
                             )

ParticipantManagement.create!(event_id: 18,
                              participant_id: 4
                             )
