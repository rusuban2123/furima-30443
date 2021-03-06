# テーブル設計

## usersテーブル

| column             | type      | options     |
|--------------------|-----------|-------------|
| email              | string    | null: false |
| encrypted_password | string    | null: false |
| nickname           | string    | null: false |
| last_name          | string    | null: false |
| first_name         | string    | null: false |
| last_kana          | string    | null: false |
| first_kana         | string    | null: false |
| birthday           | date      | null: false |

### association

- has_many :products
- has_many :comments 
- has_many :order


## productsテーブル

| column             | type       | options                        |
|--------------------|------------|--------------------------------|
| user               | references | null: false, foreign_key: true |
| name               | string     | null: false                    |
| description        | text       | null: false                    |   
| category_id        | integer    | null: false                    |
| state_id           | integer    | null: false                    |
| load_id            | integer    | null: false                    |
| shipment_source_id | integer    | null: false                    |
| day_to_ship_id     | integer    | null: false                    |
| price              | integer    | null: false                    |

### association

- has_many :comments
- has one :order
- belongs_to :user


## commentsテーブル

| column     | type       | options                        |
|------------|------------|--------------------------------|
| content    | text       | null:false                     |
| user       | references | null: false, foreign_key: true |
| product    | references | null: false, foreign_key: true |

### association

- belongs_to :user
- belongs_to :product

## shippingsテーブル

| column                 | type       | options                        |
|------------------------|------------|--------------------------------|
| postal_cord            | string     | null: false                    |
| shipment_source_id     | integer    | null: false                    |
| shipping_city          | string     | null: false                    |
| shipping_address       | string     | null: false                    |
| shipping_building      | string     |                                |
| phone_number           | string     | null: false                    |
| order                  | references | null: false, foreign_key: true |

   
  
### association

- belongs_to :order


## orderテーブル

| column      | type       | options                        |
|-------------|------------|--------------------------------|
| user        | references | null: false, foreign_key: true |
| product     | references | null: false, foreign_key: true |


### association

- belongs_to :user
- has_one :product
- has_one :shipping



