class AddStockToListItems < ActiveRecord::Migration
  def change
    add_column :list_items, :stock, :integer
  end
end
