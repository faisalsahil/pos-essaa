class ChangeIspart < ActiveRecord::Migration
  def up
    remove_column :items, :is_part
    add_column :items, :is_part, :boolean
  end

  def down
  end
end
