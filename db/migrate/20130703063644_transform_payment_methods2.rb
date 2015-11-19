class TransformPaymentMethods2 < ActiveRecord::Migration
  def up
    v = Order.last.vendor if Order.last
    v =nil#||= Vendor.where(hidden: false).first
    
    if v
      # add missing ByCard pm
      pm = PaymentMethod.new
      pm.vendor = v
      pm.company = v.company
      pm.name = "ByCard"
      pm.save
    end
  end

  def down
  end
end
