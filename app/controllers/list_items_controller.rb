class ListItemsController < ApplicationController

	def index
		@purchase_item=PurchaseItem.find(params[:purchase_item_id])
		@list_items = @purchase_item.list_items
	end
	def new
		@purchase_item = PurchaseItem.find(params[:purchase_item_id])
		@list_item = @purchase_item.list_items.build
	end
	def show
	    @list_item = ListItem.find_by_id(params[:id])

  	end
	  
	def create
	    @purchase_item = PurchaseItem.find(params[:purchase_item_id])
	    @list_item = @purchase_item.list_items.build(params[:list_item])
	    if @list_item.save
	      redirect_to purchase_item_list_items_path(@purchase_item)
	    else
	      render :new
	    end
	end
	
	def item_added
		item_ids = params[:item_ids].split(',')
		items    = Item.where(id: item_ids)
		@purchase_item      = PurchaseItem.find(params[:purchase_item_id])
		items && items.each do |item|
			list_item = ListItem.where("purchase_item_id = ? AND sku = ?", @purchase_item.id, item.sku)
			if list_item.blank?
				@list_item          = @purchase_item.list_items.build
				@list_item.name     = item.try(:name)
				@list_item.sku      = item.try(:sku)
				@list_item.stock    = item.try(:quantity)
				@list_item.save
			end
		end
		# redirect_to purchase_item_list_items_path(@purchase_item)
		redirect_to reminders_path
	end
	  
	def update
	    @list_item     = ListItem.find_by_id(params[:id])
	    @purchase_item = @list_item.purchase_item
	    if @list_item.update_attributes(params[:list_item])
	      redirect_to purchase_item_list_items_path(@purchase_item)
	    else
	      render :new
	    end
	end
		  
	def edit
	    @list_item = ListItem.find_by_id(params[:id])
	end
	
	def destroy
	    @list_item = ListItem.find_by_id(params[:id])
	    @purchase_item = @list_item.purchase_item
	    @list_item.destroy
	    redirect_to purchase_item_list_items_path(@purchase_item)
	end
end
