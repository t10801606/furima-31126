# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| email      | string | null: false |
| password   | string | null: false |
| nickname   | string | null: false |


## profiles テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| first_name        | string     | null: false                    |
| last_name         | string     | null: false                    |
| first_name_kana   | string     | null: false                    |
| last_name_kana    | string     | null: false                    |
| birth_year        | integer    | null: false                    |
| birth_month       | integer    | null: false                    |
| birth_day         | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |

## items テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| name       | string     | null: false                    |
| explain    | text       | null: false                    |
| user       | references | null: false, foreign_key: true |

## shipping テーブル

| Column        | Type        | Options                        |
| ------------- | ----------- | ------------------------------ |
| charge        | integer     | null: false                    |
| area          | varchar(10) | null: false                    |
| delivery_date | integer     | null: false                    |
| item          | references  | null: false, foreign_key: true |

## prices テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| price         | integer    | null: false                    |
| item          | references | null: false, foreign_key: true |

## items_details テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| item          | references | null: false, foreign_key: true |
| detail        | references | null: false, foreign_key: true |

## buyers テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| nickname      | string     | null: false                    |
| item          | references | null: false, foreign_key: true |

## acceptancesテーブル

| Column        | Type        | Options                        |
| ------------- | ----------- | ------------------------------ |
| postal_code   | integer     | null: false                    |
| region        | varchar(10) | null: false                    |
| city          | string      | null: false                    |
| address       | string      | null: false                    |
| building      | string      |                                |
| phone         | integer     | null: false                    |
| buyer         | references  | null: false, foreign_key: true |

## details テーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| category    | string  | null: false |
| status      | string  | null: false |