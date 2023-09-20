class Admin::InvoicesController < ApplicationController
  def index
    @invoices = Invoice.all
  end

  def show
    @invoice = Invoice.find(params[:id])
  end
  
  def update
    aninvoice = Invoice.find(params[:id])
    aninvoice.update(status: params[:status])

    redirect_to admin_invoice_path(aninvoice)
  end
end