class TransformFalseToNil < ActiveRecord::Migration
  def up
    puts "Processing orders..."
    Order.connection.execute("UPDATE orders SET is_proforma=NULL WHERE is_proforma=false;")
    Order.connection.execute("UPDATE orders SET unpaid_invoice=NULL WHERE unpaid_invoice=false;")
    Order.connection.execute("UPDATE orders SET is_quote=NULL WHERE is_quote=false;")
    Order.connection.execute("UPDATE orders SET tax_free=NULL WHERE tax_free=false;")
    Order.connection.execute("UPDATE orders SET buy_order=NULL WHERE buy_order=false;")
    Order.connection.execute("UPDATE orders SET refunded=NULL WHERE refunded=false;")
    Order.connection.execute("UPDATE orders SET paid=NULL WHERE paid=false;")
    Order.connection.execute("UPDATE orders SET hidden=NULL WHERE hidden=false;")
    
    puts "Processing order_items..."
    OrderItem.connection.execute("UPDATE order_items SET activated=NULL WHERE activated=false;")
    OrderItem.connection.execute("UPDATE order_items SET refunded=NULL WHERE refunded=false;")
    OrderItem.connection.execute("UPDATE order_items SET discount_applied=NULL WHERE discount_applied=false;")
    OrderItem.connection.execute("UPDATE order_items SET coupon_applied=NULL WHERE coupon_applied=false;")
    OrderItem.connection.execute("UPDATE order_items SET is_buyback=NULL WHERE is_buyback=false;")
    OrderItem.connection.execute("UPDATE order_items SET no_inc=NULL WHERE no_inc=false;")
    OrderItem.connection.execute("UPDATE order_items SET weigh_compulsory=NULL WHERE weigh_compulsory=false;")
    OrderItem.connection.execute("UPDATE order_items SET action_applied=NULL WHERE action_applied=false;")
    OrderItem.connection.execute("UPDATE order_items SET hidden=NULL WHERE hidden=false;")
    OrderItem.connection.execute("UPDATE order_items SET tax_free=NULL WHERE tax_free=false;")
    
    puts "Processing items..."
    Item.connection.execute("UPDATE items SET activated=NULL WHERE activated=false;")
    Item.connection.execute("UPDATE items SET hidden=NULL WHERE hidden=false;")
    Item.connection.execute("UPDATE items SET calculate_part_price=NULL WHERE calculate_part_price=false;")
    Item.connection.execute("UPDATE items SET is_gs1=NULL WHERE is_gs1=false;")
    Item.connection.execute("UPDATE items SET default_buyback=NULL WHERE default_buyback=false;")
    Item.connection.execute("UPDATE items SET weigh_compulsory=NULL WHERE weigh_compulsory=false;")
    Item.connection.execute("UPDATE items SET ignore_qty=NULL WHERE ignore_qty=false;")
    Item.connection.execute("UPDATE items SET must_change_price=NULL WHERE must_change_price=false;")
    Item.connection.execute("UPDATE items SET hidden_by_distiller=NULL WHERE hidden_by_distiller=false;")
    Item.connection.execute("UPDATE items SET track_expiry=NULL WHERE track_expiry=false;")
    
    change_column_default :cash_registers, :big_buttons, nil
    change_column_default :cash_registers, :hide_discounts, nil
    change_column_default :drawer_transactions, :drawer_amount, nil
    
    change_column_default :items, :must_change_price, nil
    change_column_default :users, :js_keyboard, nil
    change_column_default :users, :last_path, nil
    
    change_column_default :vendors, :multi_currency, nil
    
    remove_column :cash_registers, :paylife
    remove_column :cash_registers, :bank_machine_path
    
    remove_column :categories, :eod_show
    remove_column :categories, :tag
    
    drop_table :errors
  end

  def down
  end
end
