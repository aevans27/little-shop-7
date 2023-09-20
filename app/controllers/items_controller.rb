class ItemsController < ApplicationController
  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    if params[:name].present? && params[:description].present? && params[:unit_price].present?
      item.update(item_params)
      redirect_to "/merchants/#{params[:merchant_id]}/items"
      flash[:alert] = "Item has been updated"
    else
      redirect_to "/items/#{params[:id]}/edit"
      flash[:error] = "Error: All fields must be filled in to submit"
    end
  end

  private
  def item_params
    params.permit(:name, :description, :unit_price)
  end
  
end