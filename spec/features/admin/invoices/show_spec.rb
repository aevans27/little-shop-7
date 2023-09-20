require "rails_helper"

RSpec.describe "the invoice show" do
  it "shows the invoices attributes" do
    @customer_1 = Customer.create!(first_name: "Frodo", last_name: "Baggins")
    @customer_2 = Customer.create!(first_name: "Samwise", last_name: "Gamgee")

    @invoice_1k = Invoice.create!(status: "completed", customer: @customer_1, created_at: "2012-03-25 09:54:09 UTC")
    @invoice_1l = Invoice.create!(status: "in progress", customer: @customer_1)
    @invoice_2a = Invoice.create!(status: "in progress", customer: @customer_2)
    @invoice_2d = Invoice.create!(status: "completed", customer: @customer_2)
    
    visit admin_invoice_path(@invoice_1k)

    expect(page).to have_content(@invoice_1k.id)
    expect(page).to have_content("Frodo Baggins")
    expect(page).to_not have_content("Samwise")
    expect(page).to have_field('status', with: 'completed')
    expect(page).to_not have_field('status', with: 'in progress')
    expect(page).to have_content("Sunday, March 25, 2012")
  end

  it "shows its items and details" do 
    load_test_data

    visit admin_invoice_path(@invoice_1a)

    expect(find("#invoice_item-#{@invoice_items37.id}")).to have_content("Huskies")
    expect(find("#invoice_item-#{@invoice_items37.id}")).to have_content("$2.00")
    expect(find("#invoice_item-#{@invoice_items37.id}")).to have_content(13)
    expect(find("#invoice_item-#{@invoice_items37.id}")).to have_content("shipped")

    expect(find("#invoice_item-#{@invoice_items38.id}")).to have_content("Gatorade")
    expect(find("#invoice_item-#{@invoice_items38.id}")).to have_content("$2.00")
    expect(find("#invoice_item-#{@invoice_items38.id}")).to have_content(13)
    expect(find("#invoice_item-#{@invoice_items38.id}")).to have_content("shipped")
  end

  it "can calculate the total_revenue for a page" do
    load_test_data

    visit admin_invoice_path(@invoice_1a)

    expect(find("#total_revenue")).to have_content("$234.00")

  end

  it "can change the status of the invoice" do
    load_test_data

    visit admin_invoice_path(@invoice_1a)

    expect(page).to have_field('status', with: 'cancelled')
    expect(page).to_not have_field('status', with: 'completed')

    select('complete', from: 'status')
    click_button "Update Invoice Status"

    expect(page).to_not have_field('status', with: 'cancelled')
    expect(page).to have_field('status', with: 'completed')
  end

  it "has a header" do
    load_test_data

    visit admin_invoice_path(@invoice_1a)

    expect(page).to have_content("Admin: Invoice Section")
  end

end