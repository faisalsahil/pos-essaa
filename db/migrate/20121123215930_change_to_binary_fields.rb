class ChangeToBinaryFields < ActiveRecord::Migration
  def up
    remove_column :vendors, :receipt_logo_header
    remove_column :vendors, :receipt_logo_footer
    add_column :vendors, :receipt_logo_header, :binary
    add_column :vendors, :receipt_logo_footer, :binary
  end

  def down
    change_column :vendors, :receipt_logo_header, :text
    change_column :vendors, :receipt_logo_footer, :text
  end
end
