class BulkDiscountsController < ApplicationController
  def index
    @merchant = Merchant.find(params[:id])
  end

  def new
    @bulk_discount = BulkDiscount.new
  end

  def create
    @merchant = Merchant.find(params[:id])
   if params[:discount].present? && params[:threshold].present?
    @merchant.bulk_discounts.create(discount:params[:discount],
     threshold:params[:threshold])
      redirect_to "/merchants/#{@merchant.id}/bulk_discounts"
      flash[:alert] = "Item has been added to merchant"
   else
      redirect_to "/merchants/#{@merchant.id}/bulk_discounts/new"
      flash[:error] = "Error: All fields must be filled in to submit"
   end
  end
end