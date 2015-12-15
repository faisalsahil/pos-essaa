class RemindersController < ApplicationController

	def index
		@items = Item.where("quantity <= ?", 5)
	end

	def update
		@item = Item.find(params[:id])
		@item.quantity += params[:item][:quantity].to_i
		@item.save
		redirect_to reminders_path
	end
end
