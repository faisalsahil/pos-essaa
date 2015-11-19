class CopyIsProformaToOrderItems < ActiveRecord::Migration
  def up
    Vendor.connection.execute("UPDATE order_items SET is_proforma = orders.is_proforma from orders WHERE order_items.order_id = orders.id")
  end

  def down
  end
end
