class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :order_id 
      t.string  :postal_code,   null: false
      t.integer :prefectual_id, null: false 
      t.string  :city,          null: false
      t.string  :house_number,  null: false
      t.string  :building_name
      t.string  :phone_numberm, null: false
      t.timestamps
    end
  end
end
