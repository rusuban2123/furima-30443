class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.references :user,          null: false, foreign_key: true
      t.string :name,              null: false
      t.text :description,         null: false
      t.integer :category_id,      null: false
      t.integer :state_id,         null: false
      t.integer :load_id,          null: false
      t.integer :shipment_source_id,  null: false
      t.integer :day_to_ship_id,   null: false
      t.integer :price,            null: false
      t.timestamps
    end
  end
end
