# テーブル設計


## usersテーブル
| Column             | Type    | Options     |
|--------------------|---------|-------------|
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| nickname           | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| kana_last_name     | string  | null: false |
| kana_first_name    | string  | null: false |
| birthday           | date    | null: false |

### Association
- has_many :items
- has_many :records


## itemsテーブル
| Column                  | Type       | Options           |
|-------------------------|------------|-------------------|
| user                    | references | foreign_key: true |
| title                   | string     | null: false       |
| detail                  | text       | null: false       |
| category_id             | integer    | null: false       | 
| item_condition_id       | integer    | null: false       |
| item_cost_id            | integer    | null: false       |
| delivery_area_id        | integer    | null: false       |
| delivery_date_id        | integer    | null: false       |
| price                   | integer    | null: false       |

### Association
- belongs_to :user
- has_one: record


### recordsテーブル
| Column    | Type       | Options           |
|-----------|------------|-------------------|
| user      | references | foreign_key: true |
| item      | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address


### addressテーブル
| Column        | Type       | Options           |
|---------------|------------|-------------------|
| record        | references | foreign_key: true |
| postal_code   | string     | null: false       |
| prefectur_id  | integer    | null: false       |
| city          | string     | null: false       |
| house_number  | string     | null: false       |
| building_name | string     |                   |
| phone_number  | string     | null: false       |


### Association
- belongs_to :record