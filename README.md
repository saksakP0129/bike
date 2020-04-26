# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# アプリ名
bike

# 概要
ユーザー登録、ログイン機能
新規投稿、編集削除機能

# 本番環境(デプロイ先　テストアカウントID)

#制作背景
既存のバイクアプリはナビアプリや地方の走れる場所が掲載されているアプリのみ
Twitterやインスタグラムの様なユーザーが投稿するだけのアプリは見当たらなかったため
自身がツーリングで今人気のある場所を視聴者のリアル投稿から読み取ることができるので
流行りの情報収集にも使用できる。

# DEMO

# 工夫したポイント
基本的に写真をメインにしたいので、TOPページには写真の邪魔をしない様に
ユーザーとして使用できる、昨日はドロワーボックスに入れたこと。

# 使用技術（開発)
Rails 5.0.7.2環境
ruby 2.5.1
javascript,haml.scss

# 今後実装したい機能　
TOPページに表記されている画像は手元の画像を表記しているので
ユーザー投稿され中から、新着順に表示されている様にします。

# DB設計

# users テーブル

Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|email|string|null: false, default: "", unique: true|
|encrypted_password|string| null: false, default: "", unique: true|
|reset_password_token|string |
|reset_password_sent_at| datetime |

### Association
- has_many :diaries

# diaries　テーブル

Column|Type|Options|
|------|----|-------|
|title |string| null:false|
|text  |text  ||
|image |string||
|user_id|integer|null:false,foreigh_key: true| 
     
 ### Association
- belongs_to :user
