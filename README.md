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

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false, unique: true|
|tel|integer|null: false, unique: true|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|card_number|integer|null: false|
|expiration_date_month|integer|null: false|
|expiration_date_year|integer|null: false|
|sequrity_code|integer|null: false|
|introduction|text|-------|
|avatar|string|-------|
|birth_year|integer|-------|
|birth_month|integer|-------|
|birth_day|integer|-------|

### Association
- has_many :item_comments
- has_many :sns_credentials, dependent: :destroy
- has_one  :address
- has_many :items, dependent: :destroy
- has_many :transaction_users, dependent: :destroy
- has_many :transactions, through: :transaction_users, dependent: :destroy
- has_many :transaction_comments, dependent: :destroy
- has_many :rates
- has_many :likes


## addressesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|post_number|integer|null: false|
|prefecture_id|integer|null: false, foreign_key: true|
|city|string|null: false|
|address|string|null: false|
|building|string|-------|
|building_tel|integer|-------|

### Association
- belongs_to :user
- belongs_to :prefecture


## ratesテーブル

|Column|Type|Options|
|------|----|-------|
|rate|string|-------|
|user_id|integer|null: false, foreign_key: true|
|comment|text|-------|
|transaction_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :rate


## sns_credentialsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key: true|
|uid|string|-------|
|provider|string|-------|

### Association
- belongs_to :user


## prefecturesテーブル(マスターテーブル)

|Column|Type|Options|
|------|----|-------|
|prefecture|string|-------|

### Association
- has_many :addresses
- has_many :items


## item_commentsテーブル

|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item


## likesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item


## transactionsテーブル

|Column|Type|Options|
|------|----|-------|
|transaction_state_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
|buyer_id|integer|null: false, foreign_key: true|

### Association
- has_many :transaction_users, dependent: :destroy
- has_many :users, through: :transaction_users, dependent: :destroy
- belongs_to :item
- belongs_to :transaction_state
- belongs_to :buyer, class_name: "User"


## transaction_statesテーブル(マスターテーブル)

|Column|Type|Options|
|------|----|-------|
|state|string|-------|

### Association
- has_many :transactions


## transaction_commentsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|comment|text|null: false|
|transaction_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :transactions
- belongs_to :user


## transaction_usersテーブル(中間テーブル)

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|transaction_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :transaction
- belongs_to :user


## item_states(マスターテーブル)

|Column|Type|Options|
|------|----|-------|
|state|integer|null: false|

### Association
- belongs_to :item


## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|condition_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
|postage_id|integer|null: false, foreign_key: true|
|delivery_method_id|integer|null: false, foreign_key: true|
|price|integer|null: false|
|brand_id|integer|null: false, foreign_key: true|
|likes_count|integer|default: 0|
|category_id|integer|null: false, foreign_key: true|
|item_state_id|integer|null: false, foreign_key: true|

### Association
- has_many :likes, dependent: :destroy
- has_many :transactions, dependent: :destroy
- belongs_to :user
- belongs_to :prefecture
- belongs_to :condition
- has_many :category_items, dependent: :destroy
- has_many :categorys, through: :category_items
- belongs_to :delivery_day
- baelongs_to :profit
- has_many :images, dependent: :destroy
- belongs_to :brand
- belongs_to :postage
- belongs_to :delivery_method
- belongs_to :size
- has_many :item_comments
- belongs_to :item_state


## conditionsテーブル(マスターテーブル)

|Column|Type|Options|
|------|----|-------|
|condition|string|null: false|

### Association
- has_many :items


## category_itemsテーブル(中間テーブル)

|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :category


## categorysテーブル(マスターテーブル)

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|parent_id|integer|-------|

### Association
- has_many :category_items, dependent: :destroy
- has_many :items, through: :category_items, dependent: :destroy
- belongs_to :size
- belongs_to :parent, class_name: :Category
- has_many :children, class_name: :Category, foreign_key: :parent_id


## sizesテーブル(マスターテーブル)

|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|size|string|null: false|

### Association
- has_many :items
- has_many :categorys


## delivery_daysテーブル(マスターテーブル)

|Column|Type|Options|
|------|----|-------|
|days|string|null: false|

### Association
- has_many :items


## profitsテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|delivery_cost|integer|null: false|
|profit|integer|null: false|

### Association
- has_many :items


## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|image|string|null: false|

### Association
- belongs_to :item


## brandsテーブル(マスターテーブル)

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items
- has_many :categories


## postagesテーブル(マスターテーブル)

|Column|Type|Options|
|------|----|-------|
|burden|string|null: false|

### Association
- has_many :items


## delivery_methodsテーブル(マスターテーブル)

|Column|Type|Options|
|------|----|-------|
|method|string|null: false|

### Association
- has_many :items
