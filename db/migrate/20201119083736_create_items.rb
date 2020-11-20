class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,              foreign_key: true
      t.string     :title,             null: false
      t.text       :detail,            null: false
      t.integer    :category_id,       null: false
      t.integer    :item_condition_id, null: false
      t.integer    :item_cost_id,      null: false
      t.integer    :delivery_area_id,  null: false
      t.integer    :delivety_date_id,  null: false
      t.integer    :price,             null: false
      t.timestamps
    end
  end
end
