class RenameDelivetyDateIdColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :delivety_date_id, :delivery_date_id
  end
end
