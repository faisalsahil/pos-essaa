class CopyDrawerIdFromDrawerTransactions < ActiveRecord::Migration
  def up
    # the authority on the drawer_id for Order, OrderItem, PaymentMethodItem  is DrawerTransaction
    Vendor.connection.execute("UPDATE orders SET drawer_id=drawer_transactions.drawer_id from drawer_transactions WHERE drawer_transactions.order_id = orders.id")
    Vendor.connection.execute("UPDATE order_items SET drawer_id=orders.drawer_id from orders WHERE order_items.order_id = orders.id")
    Vendor.connection.execute("UPDATE payment_method_items SET drawer_id=orders.drawer_id from orders WHERE payment_method_items.order_id = orders.id")
  end

  def down
  end
end
