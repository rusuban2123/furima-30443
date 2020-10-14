# テーブル設計

## usersテーブル

| column      | type      | options     |
|-------------|-----------|-------------|
| email       | string    | null: false |
| password    | string    | null: false |
| nickname    | string    | null: false |
| last_name   | string    | null: false |
| first_name  | string    | null: false |
| last_kana   | string    | null: false |
| first_kana  | string    | null: false |
| birth_month | datetime  | null: false |
| birth_year  | datetime  | null: false |
| birth_day   | datetime  | null: false |

### association

- has_many :products
- has_many :comments 
- belongs_to :shipping
- belongs_to :creditcard

## productsテーブル

| column          | type    | options     |
|-----------------|---------|-------------|
| name            | string  | null: false |
| image           | text    | null: false |
| description     | text    | null: false |
| category        | string  | null: false |
| state           | string  | null: false |
| load            | integer | null: false |
| shipment_source | text    | null: false |
| day_to_ship     | integer | null: false |
| price           | integer | null: false |

### association

- has_many :comments
- belongs_to :user

## commentsテーブル

| column  | type       | options                        |
| content | text       | null:false                     |
| user    | references | null: false, foreign_key: true |
| product | references | null: false, foreign_key: true |

### association

- belongs_to :user
- belongs_to :product

## shippingsテーブル

| column              | type     | options     |
|---------------------|----------|-------------|
| postal_cord         | string   | null: false |
| shipping_prefecture | string   | null: false |
| shipping_city       | string   | null: false |
| shipping_address    | string   | null: false |
| phone_number        | string   | null: false |

### association

- belongs_to :user

## creditcardsテーブル
 
| column         | type     | options      |
|----------------|----------|--------------|
| card_number    | integer  | null : false |
| month_deadline | datetime | null : false |
| year_deadline  | datetime | null : false |
| day_deadline   | datetime | null : false |
| security_cord  | integer  | null : false |    

### association

- belongs_to :user