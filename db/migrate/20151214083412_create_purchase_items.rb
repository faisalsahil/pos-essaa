class CreatePurchaseItems < ActiveRecord::Migration
  def change
    create_table :purchase_items do |t|

      t.timestamps
    end
  end
end
