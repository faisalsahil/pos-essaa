class AddExpiryDateToItems < ActiveRecord::Migration
  def change
    add_column :items, :expiry_date, :date
  end
end
