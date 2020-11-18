# テーブル設計


## usersテーブル
| Column          | Type    | Options     |
|-----------------|---------|-------------|
| email           | string  | null: false |
| password        | string  | null: false |
| nick_name       | string  | null: false |
| last_name       | string  | null: false |
| first_name      | string  | null: false |
| kana_last_name  | string  | null: false |
| kana_first_name | string  | null: false |
| birthday_year   | integer | null: false |
| birthday_month  | integer | null: false |
| birthday_day    | integer | null: false |

### Association
- has_many :items
- has_many :records


## itemsテーブル
| Column               | Type      | Options           |
|----------------------|-----------|-------------------|
| user                 | reference | foreign_key: true |
| title                | text      | null: false       |
| sub_title            | text      | null: false       |
| item_condition       | string    | null: false       |
| responsibe_item_cost | integer   | null: false       |
| delivery_area        | string    | null: false       |
| delivery_date        | datetime  | null: false       |
| price                | integer   | null: false       |
| image                |           |                   |

### Association
- belongs_to :user
- has_one: record


### recordsテーブル
| Column    | Type      | Options           |
|-----------|-----------|-------------------|
| user      | reference | foreign_key: true |
| item      | reference | foreign_key: true |
| card_info | integer   | null: false       |
| address   | text      | null: false       |

### Association
- belongs_to :user
- belongs_to :item