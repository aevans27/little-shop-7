class MerchantItemsController < ApplicationController
  def index
    @merchant = Merchant.find(params[:merchant_id])
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @merchant = Merchant.find(params[:merchant_id])
    @merchant.items.create!(name:params[:name],
     description:params[:description],
      unit_price:params[:price])

      redirect_to "/merchants/#{params[:merchant_id]}/items"
  end

  def update 
    merchant = Merchant.find(params[:merchant_id])
    item = merchant.items.find(params[:id])

    item.update(status: params[:status])
    redirect_to "/merchants/#{params[:merchant_id]}/items"
  end
  
  def new
    @item = Item.new
  end
end