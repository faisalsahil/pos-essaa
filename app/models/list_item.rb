class ListItem < ActiveRecord::Base
  attr_accessible :name, :quantity
  belongs_to :purchase_item
end
