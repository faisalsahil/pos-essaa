class ChangeReceiptsText < ActiveRecord::Migration
  def up
    remove_column :receipts, :content
    add_column :receipts, :content, :binary

  end

  def down
  end
end
