class AddSkuToListItems < ActiveRecord::Migration
  def change
    add_column :list_items, :sku, :string
  end
end
