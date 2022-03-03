# README

## users TABLE

|Column|Type|Options|
|-|-|-|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|encrypted_password|string|null: false|
|family_name|string|null: false|
|first_name|string|null:false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_year|integer|null:false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|

### Association
  - has_many :items
  - has_many :purchase_infos
  - belongs_to :birth_year (active_hash)
  - belongs_to :birth_month (active_hash)
  - belongs_to :birth_day (active_hash)

## items TABLE

|Column|Type|Options|
|-|-|-|
|name|string|null: false|
|description|text|null: false|
|category_id|integer|null: false|
|condition_id|integer|null: false|
|delivery_fee_task_id|integer|null: false|
|delivery_from_id|integer|null: false|
|delivery_day_id|integer|null: false|
|price|integer|null: false|

### Association
  - belongs_to :user
  - has_many :purchase_infos
  - belongs_to :category (active_hash)
  - belongs_to :condition (active_hash)
  - belongs_to :delivery_fee_task (active_hash)
  - belongs_to :prefecture (active_hash)
  - belongs_to :delivery_day (active_hash)

## purchase_info TABLE

|Column|Type|Options|
|-|-|-|
|purchase_user|references|null: false, foreign_key: true|
|purchase_item|references|null: false, foreign_key: true|

### Association
  - belongs_to :user
  - belongs_to :item
  - has_one :delivery_info

## delivery_info TABLE

|Column|Type|Options|
|-|-|-|
|post_code|string|null: false|
|prefecture_id|integer|null: false|
|city|string|null: false|
|address|string|null: false|
|building_name|string|-|
|phone_number|integer|null: false|
|purchase_info|references|null: false|

### Association
- belongs_to :purchase_info
- belongs_to :prefecture (active_hash)

## birth_year, birth_month, birth_day TABLE Association
- has_many :users (active_hash)

## category, condition, delivery_fee_task, prefecture, delivery_day TABLE Association
- has_many :items (active_hash)