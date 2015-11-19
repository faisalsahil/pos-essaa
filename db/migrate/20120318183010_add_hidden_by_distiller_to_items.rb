class AddHiddenByDistillerToItems < ActiveRecord::Migration
  def change
    add_column :items, :hidden_by_distiller, :boolean, :default => false

  end
end
