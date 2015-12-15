class AddColumnToPurchaseItems < ActiveRecord::Migration
  def change
    add_column :purchase_items, :name, :string
    add_column :purchase_items, :quantity, :integer
  end
end
