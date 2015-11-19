class ChangePaidToBoolean < ActiveRecord::Migration
  def up
    remove_column :orders, :paid
    add_column :orders, :paid, :boolean
  end

  def down
    change_column :orders, :paid, :integer
  end
end
