class RemindersController < ApplicationController

	def index
		if params[:keyword].blank?
			@items = Item.where("quantity = ? OR Date(expiry_date) <= ? OR expiry_date IS ?", 0, Date.today + 1.month, nil)
		else
			@items = Item.where("lower(name) like ?", "%#{params[:keyword]}%".downcase)
		end
		@items = @items.page(params[:page]).per(100)
		@items.sort_by!{ |m| m.name.downcase }
		@purchase_items = PurchaseItem.all
	end

	def edit
		@item = Item.find_by_id(params[:id])
	end

	def update
		@item = Item.find(params[:id])
		prev_stock = @item.quantity
		@item.update_attributes(params[:item])
		@item.quantity += prev_stock
		@item.save
		redirect_to reminders_path
	end
end
