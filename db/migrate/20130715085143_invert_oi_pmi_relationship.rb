class InvertOiPmiRelationship < ActiveRecord::Migration
  def up
    add_column :payment_method_items, :order_item_id, :integer
    
    Vendor.connection.execute("UPDATE payment_method_items SET order_item_id = order_items.id from order_items WHERE order_items.refund_payment_method_item_id = payment_method_items.id")
    remove_column :order_items, :refund_payment_method_item_id
  end

  def down
  end
end
