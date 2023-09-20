class MerchantItemsController < ApplicationController
  def index
    @merchant = Merchant.find(params[:merchant_id])
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @merchant = Merchant.find(params[:merchant_id])
   if params[:name].present? && params[:description].present? && params[:price].present?
    @merchant.items.create(name:params[:name],
     description:params[:description],
      unit_price:params[:price])
      redirect_to merchant_items_path(@merchant)
      flash[:alert] = "Item has been added to merchant"
   else
      redirect_to "/merchants/#{@merchant.id}/items/new"
      flash[:error] = "Error: All fields must be filled in to submit"
   end
  end

  def update 
    merchant = Merchant.find(params[:merchant_id])
    item = merchant.items.find(params[:id])

    item.update(status: params[:status])

    redirect_to merchant_items_path(merchant)
  end
  
  def new
    @item = Item.new
  end
end