class RemindersController < ApplicationController

	def index
		@items = Item.where("quantity <= ? OR expiry_date <= ? OR expiry_date IS NULL", 5, Date.today + 5.day)
		@items.sort_by!{ |m| m.name.downcase }

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
