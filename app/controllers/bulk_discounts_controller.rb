class BulkDiscountsController < ApplicationController
  def index
    @merchant = Merchant.find(params[:merchant_id])
  end

  def new
    @bulk_discount = BulkDiscount.new
  end

  def show
    @bulk_discount = BulkDiscount.find(params[:id])
  end

  def create
    @merchant = Merchant.find(params[:merchant_id])
    if @merchant.bulk_discounts.find_by(discount: params[:discount], threshold: params[:threshold])
      redirect_to "/merchants/#{@merchant.id}/bulk_discounts/new"
      flash[:error] = "Error: Merchant discount already exists"
    else
      if params[:discount].present? && params[:threshold].present?
        if params[:threshold].to_i > 0 && params[:discount].to_i > 0 && params[:discount].to_i < 100
          @merchant.bulk_discounts.create(discount:params[:discount],
          threshold:params[:threshold])
            redirect_to "/merchants/#{@merchant.id}/bulk_discounts"
            flash[:alert] = "Discount has been added to merchant"
        else
          redirect_to "/merchants/#{@merchant.id}/bulk_discounts/new"
          flash[:error] = "Error: All fields have valid number values"
        end
       else
          redirect_to "/merchants/#{@merchant.id}/bulk_discounts/new"
          flash[:error] = "Error: All fields must be filled in to submit"
       end
    end
  end

  def destroy 
    merchant = Merchant.find(params[:merchant_id])
    if merchant.check_if_invoice_in_progress
      redirect_to "/merchants/#{params[:merchant_id]}/bulk_discounts"
      flash[:error] = "Discount applied to pending invoice, can't delete"
    else
      discount = merchant.bulk_discounts.find(params[:discount_id])
      discount.destroy
      redirect_to "/merchants/#{params[:merchant_id]}/bulk_discounts"
      flash[:alert] = "Discount has been deleted"
    end
    
  end

  def edit
    @bulk_discount = BulkDiscount.find(params[:id])
  end

  def update
    bulk_discount = BulkDiscount.find(params[:id])
    if bulk_discount.merchant.check_if_invoice_in_progress
      redirect_to "/merchants/#{params[:merchant_id]}/bulk_discounts"
      flash[:alert] = "Discount applied to pending invoice, can't update"
    else
      if params[:discount].present? && params[:threshold].present?
        if params[:threshold].to_i > 0 && params[:discount].to_i > 0 && params[:discount].to_i < 100
          bulk_discount.update(discount: params[:discount], threshold: params[:threshold])
          redirect_to "/merchants/#{params[:merchant_id]}/bulk_discounts"
          flash[:alert] = "Discount has been updated"
        else
          redirect_to "/bulk_discounts/#{params[:id]}/edit"
          flash[:error] = "Error: All fields have valid number values"
        end
      else
        redirect_to "/bulk_discounts/#{params[:id]}/edit"
        flash[:error] = "Error: All fields must be filled in to submit"
      end
    end
  end
end