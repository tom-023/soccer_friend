# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




name = "テスト1号"
email = "test1gou@gmail.com"
support_team = "鹿島アントラーズ"
support_history = "2"
password = "password"
User.create!(name: name,
             email: email,
             support_team: support_team,
             support_history: support_history,
             password: password,
             password_confirmation: password,
            )

name = "テスト2号"
email = "test2gou@gmail.com"
support_team = "FC東京"
support_history = "6"
password = "password"
User.create!(name: name,
             email: email,
             support_team: support_team,
             support_history: support_history,
             password: password,
             password_confirmation: password,
            )


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
