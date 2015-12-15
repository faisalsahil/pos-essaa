class PurchaseItem < ActiveRecord::Base
  attr_accessible :name
  has_many :list_items
end
