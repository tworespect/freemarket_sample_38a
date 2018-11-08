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

## user_detailsテーブル

|column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|first_name_kanji|string||
|last_name_kanji|string||
|first_name_kana|string||
|last_name_kana|string||
|payment|integer||

### Association
- belongs_to :user
- belongs_to :deposit
- belongs_to :credit_card
- belongs_to :point
- belongs_to :address
- belongs_to :profile
- has_many :rates

## depositsテーブル

|column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|proceeds|integer||

### Association
- belongs_to :user_detail
- belongs_to :banks

## banksテーブル

|column|Type|Options|
|------|----|-------|
|deposit_id|integer|null: false, foreign_key: true|
|bank_name|string||
|type|string||
|branch_code|string||
|account_number|string||
|first_name_kana|string||
|last_name_kana|string||

### Association
- belongs_to :deposit

## credit_cardsテーブル

|column|Type|Options|
|------|----|-------|
|user_detail_id|integer|null: false, foreign_key: true|
|main_number|string||
|month|integer||
|year|integer||
|security_code|integer||

### Association
- belongs_to :user_detail

## pointsテーブル

|column|Type|Options|
|------|----|-------|
|user_detail_id|integer|null: false, foreign_key: true|
|point_365|integer||
|point_180|integer||
|effective_term|string|

### Association
- belongs_to :user_detail

## addressesテーブル

|column|Type|Options|
|------|----|-------|
|user_detail_id|integer|null: false, foreign_key: true|
|postal_code|string||
|prefecture|text||
|city|text||
|street_address|text||
|building|text||
|phone|string||

### Association
- belongs_to :user_detail

## birthdaysテーブル

|column|Type|Options|
|------|----|-------|
|user_detail_id|integer|null: false, foreign_key: true|
|birth_year|integer||
|birth_month|integer||
|birth_year|integer||

### Association
- belongs_to :user_detail

## profilesテーブル

|column|Type|Options|
|------|----|-------|
|user_detail_id|integer|null: false, foreign_key: true|
|image|text||
|text|text||

### Association
- belongs_to :user_detail

## productsテーブル

|column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, unique: true, index: true|
|name|string||
|price|integer||
|satatus|string||

### Association
- belongs_to :product_detail
- belongs_to :order
- belongs_to :user
- has_many :transaction_comments
- has_many :product_page_comments
- has_many :likes

## product_detailsテーブル

|column|Type|Options|
|------|----|-------|
|product_id|integer|null: false, foreign_key: true|
|state_of_goods|text||
|freight|integer||
|description|text||
|size|string||

### Association
- belongs_to :product
- belongs_to :delivery
- belongs_to :image
- belongs_to :product_detail_brand
- belongs_to :product_detail_category

## imagesテーブル

|column|Type|Options|
|------|----|-------|
|product_id|integer|null: false, foreign_key: true|
|first_image|text|null: false, foreign_key: true|
|second_image|text||
|third_image|text||
|forth_image|text||

### Association
- belongs_to :product_detail

## deliveriesテーブル

|column|Type|Options|
|------|----|-------|
|product_id|integer|null: false, foreign_key: true|
|ship_method|string||
|ship_form_location|string||
|ship_day|string||

### Association
- belongs_to :product_detail



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
