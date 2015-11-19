class CopyAndFixTimestamps < ActiveRecord::Migration
  def up
    # in the old system, created_at of the Order was updated upon completion. we copy that into the new completed_at attrs of Order and OrderItem
    Vendor.connection.execute("UPDATE order_items SET completed_at = orders.created_at from orders WHERE order_items.order_id = orders.id")
    Vendor.connection.execute("UPDATE orders SET completed_at = created_at")
  end

  def down
  end
end
