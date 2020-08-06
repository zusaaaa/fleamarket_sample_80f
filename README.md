# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

# フリマアプリ DB設計

## userテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|email|string|null: false|
|password|string|null: false, unique: true, minimum: 7|
|family_name(kanji)|string|null: false|
|first_name(kanji)|string|null:false|
|family_name(kana)|string|null: false|
|first_name(kana)|string|null: false|
|birthday(y_m_d)|string|null: false|
|postal_code|string|null:false|
|prefecture|string|null: false|
|city|string|null:false|
|house_number|string|null:false|
|number_sign_etc|string||
|phone_number|integer||
### Association
- has many :favorite
- has many :order through  :user-order
- has many :product
- has many :comment
- has many :credit_card

## user-orderテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|order_id|integer|null: false, foreign_key: true|
### Association
- belongs to :user
- belongs to :order

## orderテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|integer|null: false, foreign_key: true|
### Association
- has many :user through :user-order
- belongs to :product

## credit_cardテーブル
|Column|Type|Options|
|------|----|-------|
|card_brand|string|null: false|
|card_last_number|integer|null: false, maximum: 4|
|expiration_year|integer|null: false, maximum: 2|
|expiration_month|integer|null: false, maximum: 2|
### Association
- belongs to :user

## favoriteテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|date_and_time|datetime|null: false|
|user_id|integer|foreign_key: true|
### Association
- belongs to :user
- belongs to :product

## productテーブル
|Column|Type|Options|
|------|----|-------|
|image|string||
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
- has many :favorite
- has many :category through :product-category
- has many :image
- has many :comment

## commentテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|
### Association
- belongs to :product
- belongs to :user

## product-categoryテーブル
|Column|Type|Options|
|------|----|-------|
|category_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|
### Association
- belongs to :product
- belongs to :category

## categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
- has many :product through :product-category

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
