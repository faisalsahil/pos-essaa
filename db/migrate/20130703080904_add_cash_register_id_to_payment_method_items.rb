class AddCashRegisterIdToPaymentMethodItems < ActiveRecord::Migration
  def change
    add_column :payment_method_items, :cash_register_id, :integer
    
    Vendor.connection.execute("UPDATE payment_method_items SET cash_register_id = orders.cash_register_id from orders WHERE orders.id = payment_method_items.order_id")
  end
end
