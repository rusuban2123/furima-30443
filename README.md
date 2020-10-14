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
- has_many :purchasedproducts
- belongs_to :shipping
- belongs_to :purchaser

## productsテーブル

| column             | type       | options                        |
|--------------------|------------|--------------------------------|
| user_id            | references | null: false, foreign_key: true |
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
- has_many :purchasedproducts
- belongs_to :user
- belongs_to :purchaser

## commentsテーブル

| column     | type       | options                        |
|------------|------------|--------------------------------|
| content    | text       | null:false                     |
| user_id    | references | null: false, foreign_key: true |
| product_id | references | null: false, foreign_key: true |

### association

- belongs_to :user
- belongs_to :product

## shippingsテーブル

| column                 | type     | options     |
|------------------------|----------|-------------|
| postal_cord_id         | integer  | null: false |
| shipping_prefecture_id | integer  | null: false |
| shipping_city          | string   | null: false |
| shipping_address       | string   | null: false |
| shipping_building      | string   |             |
| phone_number           | string   | null: false |
  
### association

- belongs_to :user

## purchasedproductsテーブル

| column     | type       | options                        |
|------------|------------|--------------------------------|
| user_id    | references | null: false, foreign_key: true |
| product_id | references | null: false, foreign_key: true |

### association

- belongs_to :users
- belongs_to :products



