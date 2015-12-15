class PurchaseItemsController < ApplicationController

	def index
		@purchase_items = PurchaseItem.all
	end
	def new
		@purchase_item = PurchaseItem.new
	end
	def show
	    @purchase_item = PurchaseItem.find_by_id(params[:id])

  	end
	  
	def create
	    @purchase_item = PurchaseItem.new(params[:purchase_item])
	    if @purchase_item.save
	      redirect_to purchase_items_path
	    else
	      render :new
	    end
	end
	  
	def update
	    @purchase_item = PurchaseItem.find_by_id(params[:id])
	    if @purchase_item.update_attributes(params[:purchase_item])
	      redirect_to purchase_items_path
	    else
	      render :new
	    end
	end
		  
	def edit
	    @purchase_item = PurchaseItem.find_by_id(params[:id])
	    render :new
	end
	  
	def destroy
	    @purchase_item = PurchaseItem.find_by_id(params[:id])
	    @purchase_item.list_items.destroy_all
	    @purchase_item.destroy
	    redirect_to purchase_items_path
	end
end
