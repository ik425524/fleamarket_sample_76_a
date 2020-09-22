# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version

- System dependencies

- Configuration

- Database creation

README

# users_table

| column   | Type   | Options                   |
| -------- | ------ | ------------------------- |
| nickname | string | null: false               |
| email    | string | null: false, unipue: true |
| password | string | null: false               |

## Association

- has_one :profile
- has_one :user_address
- has_one :card
- has_many :items
- has_many :comments
- has_many :buyer_products, class_name: "Item"
- has_many :saler_products, class_name: "Item"

# profiles_table

| column     | Type       | Options                       |
| ---------- | ---------- | ----------------------------- |
| first_name | string     | null: false                   |
| last_name  | string     | null: false                   |
| first_kana | string     | null: false                   |
| last_kana  | string     | null: false                   |
| birthday   | date       | null: false                   |
| phone      | string     |
| user       | references | null: false,foregin_key: true |

## Association

- belongs_to :user

# User_addresses_table
|column|Type|Options|
|------|----|-------|
|post_code |integer|null: false|
|prefecture_id(active_hash)|integer|null: false|
|city |string|null: false|
|address |string|
|apartment |string|
|phone |string|
|user |references|null: false, foregin_key: true|

## Association

- belongs_to :user
- belongs_to_active_hash :prefecture

# cards_table

| column      | Type    | Options                        |
| ----------- | ------- | ------------------------------ |
| user_id     | string  | null: false, foregin_key: true |
| customer_id | integer | null: false                    |
| card_id     | integer | null: false                    |

## Association

- belongs_to :user

# products_table
|column|Type|Options|
|------|----|-------|
|name       |string|
|description|text|
|price      |integer|
|user       |references|null: false, foregin_key: true|
|category   |references|null: false, foregin_key: true|
|brand      |references|foregin_key: true|
|state_id(active_hash) |integer|null: false, foregin_key: true|
|size_id(active_hash)  |integer|null: false, foregin_key: true|
|cost_id(active_hash)  |integer|null: false, foregin_key: true|
|region_id(active_hash)|integer|null: false, foregin_key: true|
|period_id(active_hash)|integer|null: false, foregin_key: true|
|buyer      |references|foregin_key: {to_table: :users}|
|saler      |references|foregin_key: {to_table: :users}|

## Association

- belongs_to :user
- belongs_to :category
- belongs_to :brand
- belongs_to_active_hash :size
- belongs_to_active_hash :state
- belongs_to_active_hash :cost
- belongs_to_active_hash :period
- belongs_to_active_hash :region
- belongs_to :buyer, class_name: "User", foregin_key: "buyer_id"
- belongs_to :saler, class_name: "User", foregin_key: "saler_id"
- has_many :images
- has_many :comments

# categories_table

| column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| ancestry | string | index: true |

## Association
- has_many :products
- has_ancestry

# brands_table

| column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

## Association
- has_many :products

# images_table

| column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| image  | string     |
| item   | references | null: false, foregin_key: true |

## Association
- belongs_to :product

- belongs_to :item

# comments_table

| column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | text       |
| user   | references | null: false, foregin_key: true |
| item   | references | null: false, foregin_key: true |

## Association

- has_many :user
- has_many :products

master

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- ...
