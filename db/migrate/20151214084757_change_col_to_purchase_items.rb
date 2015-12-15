class ChangeColToPurchaseItems < ActiveRecord::Migration
  def change
  	remove_column :purchase_items, :quantity
  	add_column :list_items, :purchase_item_id, :integer
  end
end
