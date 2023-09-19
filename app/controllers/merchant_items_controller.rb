class MerchantItemsController < ApplicationController #named for MerchantsItems because I was getting an error that was looking for MerchantsItems due to the routing. 
  def index
    @merchant = Merchant.find(params[:merchant_id])
  end

  def show
    @item = Item.find(params[:item_id])
  end

  def update 
    # require 'pry';binding.pry
    merchant = Merchant.find(params[:merchant_id])
    item = merchant.items.find(params[:item_id])

    item.update(status: params[:status])
    redirect_to "/merchants/#{params[:merchant_id]}/items"
  end

  def create
    @merchant = Merchant.find(params[:merchant_id])
    @merchant.items.create!(name:params[:item][:name],
     description:params[:item][:description],
      unit_price:params[:item][:price])

      redirect_to "/merchants/#{params[:merchant_id]}/items"
  end
  
  def new
    @item = Item.new
  end
  private
  
  def item_params
    params.permit(:name, :description, :unit_price)
  end

  
end