class ChangeIsBusyDefault < ActiveRecord::Migration
  def up
    change_column_default :nodes, :is_busy, false
  end

  def down
  end
end
