require "rails_helper"

RSpec.describe "the invoice index" do
  it "lists all invoices and their attributes" do
    @customer_1 = Customer.create!(first_name: "Frodo", last_name: "Baggins")
    @customer_2 = Customer.create!(first_name: "Samwise", last_name: "Gamgee")
    @customer_3 = Customer.create!(first_name: "Meridoc", last_name: "Brandybuck")

    @invoice_1k = Invoice.create!(status: "completed", customer: @customer_1)
    @invoice_1l = Invoice.create!(status: "completed", customer: @customer_1)
    @invoice_2a = Invoice.create!(status: "in progress", customer: @customer_2)
    @invoice_2d = Invoice.create!(status: "in progress", customer: @customer_2)
    @invoice_3a = Invoice.create!(status: "cancelled", customer: @customer_3)
    @invoice_3b = Invoice.create!(status: "cancelled", customer: @customer_3)

    visit admin_invoices_path

    expect(page).to have_link("Invoice: #{@invoice_1k.id}")
  end

  it "has a header" do
    load_test_data

    visit admin_invoices_path

    expect(page).to have_content("Admin: Invoice Section")
  end

  








end