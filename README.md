# テーブル設計

## users テーブル

| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| email             | string     | null: false |
| password          | string     | null: false |
| nickname          | string     | null: false |
| first_name        | string     | null: false |
| last_name         | string     | null: false |
| first_name_kana   | string     | null: false |
| last_name_kana    | string     | null: false |
| birth_day         | day        | null: false |

### Association

- has_many :items
- has_one :buyer

## items テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| name          | string     | null: false |
| explain       | text       | null: false |
| charge        | integer    | null: false |
| area          | integer    | null: false |
| delivery_date | integer    | null: false |
| price         | integer    | null: false |
| category      | string     | null: false |
| status        | string     | null: false |

### Association

- belongs_to :user
- has_one :buyer

## buyers テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :acceptance

## acceptancesテーブル

| Column        | Type        | Options                        |
| ------------- | ----------- | ------------------------------ |
| postal_code   | string      | null: false                    |
| region        | integer     | null: false                    |
| city          | string      | null: false                    |
| address       | string      | null: false                    |
| building      | string      |                                |
| phone         | string      | null: false                    |
| buyer         | references  | null: false, foreign_key: true |

### Association

- belongs_to :buyer