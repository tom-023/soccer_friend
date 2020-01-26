# README

# アプリ名
サカとも

## アプリコンセプト
サッカースタジアム観戦を一緒に行ける友達を募集してサッカー仲間の輪を広げる。
今後もサッカー好き同士のコミュニティを軸にマッチングサービスを追加していく。

## バージョン
- Ruby 2.6.3
- Rails 5.2.3

## テストユーザー
- email: user-test@g.com
- password: 111111

## 機能一覧
- ユーザー登録機能
- ユーザー編集・退会（論理削除）機能
- ログイン機能
- SNSログイン機能
- スタジアム仲間募集（以下：イベント）作成
- イベント一覧
- イベント詳細
- イベント情報編集・削除機能
- イベントタグ検索機能
- イベントチーム検索機能
- イベント最新順に並び替えるソート機能
- イベント参加機能
- イベントキャンセル機能
- ユーザー間のチャット機能
- ランキング機能（参加者の多いイベント）
- 管理者権限
- イベント参加・キャンセルが発生した場合のメール自動送信機能

## 今後の実装予定
- 予定が入りチケットを譲りたい人とチケットがほしい人をマッチングさせる機能（チケット不正転売禁止法を遵守）

## カタログ設計
https://docs.google.com/spreadsheets/d/1d3o5DZ5SNKctVLCXlURhV2PM1qucIeUgbgAykBQ83jw/edit#gid=0

## テーブル定義
https://docs.google.com/spreadsheets/d/1d3o5DZ5SNKctVLCXlURhV2PM1qucIeUgbgAykBQ83jw/edit#gid=1385202560

## ER図
https://cacoo.com/diagrams/y9RGKKS4lKelGtCA/C351C

## 画面推移図
https://cacoo.com/diagrams/y9RGKKS4lKelGtCA/88CA9

## 画面ワイヤーフレーム
https://docs.google.com/spreadsheets/d/1d3o5DZ5SNKctVLCXlURhV2PM1qucIeUgbgAykBQ83jw/edit#gid=1679166445

https://cacoo.com/diagrams/y9RGKKS4lKelGtCA/1B3EC

## 使用Gem
- kaminari
- devise
- OmniAuth
- rails_admin
- cancancan
- letter_opener_web
- carrierwave
- mini_magick
- omniauth
- omniauth-twitter
- ransack
- paranoia
