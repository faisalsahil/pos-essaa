class AddEmployeeToOrderItems < ActiveRecord::Migration
  def change
    begin
      add_column :order_items, :employee_id, :integer
    rescue
      puts $!.inspect
    end
    OrderItem.connection.execute("update order_items set employee_id = (select employee_id from orders where id = order_items.order_id)")
  end
end
