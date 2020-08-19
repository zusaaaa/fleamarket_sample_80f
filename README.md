# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

# フリマアプリ DB設計

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|string|null:false|
|prefecture|string|null: false|
|city|string|null:false|
|house_number|string|null:false|
|number_sign_etc|string||
|user_id|integer|null: false, foreign_key|
### Association
- belongs_to :user

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|email|string|null: false|
|password|string|null: false, unique: true, minimum: 7|
|family_name_kanji|string|null: false|
|first_name_kanji|string|null:false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday_y_m_d|string|null: false|
|phone_number|integer||
### Association
- has_many :addresses
- has_many :favorites
- has_many :orders
- has_many :products
- has_many :comments
- has_many :credit_cards

## ordersテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|integer|null: false, foreign_key: true|
|seller_id|integer|null: false, foreign_key: true|
|buyer_id|integer|null; false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :product

## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
## referenceに変更
|user_id|integer|null: false foreign_key: true|
## payjpで入力する情報のみに変更
|customer_id|string|null: false|
|card_id|string|null: false|
### Association
- belongs_to :user

## favoritesテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :product

## productsテーブル
|Column|Type|Options|
|------|----|-------|
|product_name|string|null: false|
|product_explanation|string|null: false|
|brand|string||
|product_status|string|null:false|
|shipping_method|string|null: false|
|shipping_charge|string|null: false|
|shipping_area|string|null: false|
|days_until_shipping|string|null:false|
|price|integer|null: false|
|user_id|integer|null:false, foreign_key: true|
### Association
- belongs_to :user
- has_one :order
- has_many :favorites
- belongs_to :category
- has_many :images
- has_many :comments

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :product
- belongs_to :user

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
- has_many :products

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
