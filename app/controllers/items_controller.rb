class ItemsController < ApplicationController
  def edit
    @item = Item.find(params[:id])
  end

  def update
    
    item = Item.find(params[:id])

    item.update(item_params)
    redirect_to "/merchants/#{params[:merchant_id]}/items"
  end

  private
  def item_params
    params.permit(:name, :description, :unit_price)
  end
  
end