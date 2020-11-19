class CreateItemCosts < ActiveRecord::Migration[6.0]
  def change
    create_table :item_costs do |t|

      t.timestamps
    end
  end
end
