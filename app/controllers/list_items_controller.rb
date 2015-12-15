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
	  
	def update
	    @list_item = ListItem.find_by_id(params[:id])
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
