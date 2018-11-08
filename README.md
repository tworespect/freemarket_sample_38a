# README

## social_profilesテーブル

|column|Type|Options|
|------|----|-------|
|provider|string||
|uid|string||
|token|string||
|nickname|string||
|email|varchar||

### Association
- has_many :users

## usersテーブル

|column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true, index: true|
|email|varchar||

### Association
- belongs_to :social_profile
- belongs_to :user_detail
- has_many :rates
- has_many :products
- has_many :users_news
- has_many :notices
- has_many :todos
- has_many :news
- has_many :transaction_comments
- has_many :product_page_comments
- has_many :likes
- has_many :orders

## noticesテーブル

|column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|text|text||

### Association
- belongs_to :user

## todosテーブル

|column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|text|text||

### Association
- belongs_to :user

## news_usersテーブル

|column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|news_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :news

## newsテーブル

|column|Type|Options|
|------|----|-------|
|title|text||
|text|text||
|personal|integer||

### Association
- has_many :users, through: news_users
- has_many :news_users
- accepts_nested_attributes_for :news_users

## ratesテーブル

|column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|user_detail_id|integer|null: false, foreign_key: true|
|rating|integer||

### Association
- belongs_to :user
- belongs_to :user_detail



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
