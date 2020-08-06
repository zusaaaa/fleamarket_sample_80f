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
### Association
- has many :users

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
- belongs to :address
- has many :favorites
- has many :order through  :user-orders
- has many :products
- has many :comments
- has many :credit_cards

## user-orderテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|order_id|integer|null: false, foreign_key: true|
### Association
- belongs to :user
- belongs to :order

## ordersテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|integer|null: false, foreign_key: true|
### Association
- has many :users through :user-orders
- belongs to :product

## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|card_brand|string|null: false|
|card_last_number|integer|null: false, maximum: 4|
|expiration_year|integer|null: false, maximum: 2|
|expiration_month|integer|null: false, maximum: 2|
### Association
- belongs to :user

## favoritesテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|integer|foreign_key: true|
|user_id|integer|foreign_key: true|
### Association
- belongs to :user
- belongs to :product

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
- belongs to :user
- belongs to :order
- has many :favorites
- belongs to :category
- has many :images
- has many :comments

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|
### Association
- belongs to :product
- belongs to :user

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
- has many :products

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
