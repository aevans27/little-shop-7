class MerchantInvoicesController < ApplicationController
  def index
    @merchant = Merchant.find(params[:merchant_id])
  end

  def show
    @invoice = Invoice.find(params[:id])
  end

  def update
    invoice_item = InvoiceItem.find(params[:in_item_id])
    invoice_item.update(status: params[:status])

    redirect_to merchant_invoice_path(invoice_item)
  end
end