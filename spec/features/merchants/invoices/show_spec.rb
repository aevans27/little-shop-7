require "rails_helper"

RSpec.describe "Merchant Invoice Show page" do 
  before(:each) do 
    load_test_data
  end
  it "shows a list of all my items" do 
    visit "merchants/#{@merchant1.id}/invoices/#{@invoice_1.id}"

    within "#single_invoice" do 
       expect(page).to have_content(@invoice_1.id)
       expect(page).to have_content(@invoice_1.status.capitalize)
       expect(page).to have_content(@invoice_1.customer.first_name)
       expect(page).to have_content(@invoice_1.customer.last_name)
    end
  end

  it "shows its items and details" do 
    load_test_data

    visit "merchants/#{@merchant1.id}/invoices/#{@invoice_1.id}"
    invoice_item = @invoice_1.invoice_items.first

    within "#invoice_items" do 
      expect(page).to have_content(invoice_item.item.name)
       expect(page).to have_content(invoice_item.quantity)
       expect(page).to have_content("$314.15")
       expect(page).to have_content(invoice_item.status)
    end
  end

  it "can calculate the total_revenue for Merchant Ivoices show page" do
    load_test_data

    visit "merchants/#{@merchant1.id}/invoices/#{@invoice_1.id}"

    expect(find("#total_revenue")).to have_content("$4,083.95")

  end

  it "can change the status of the merchant invoice item" do
    load_test_data

    visit "merchants/#{@merchant1.id}/invoices/#{@invoice_1.id}"

    expect(page).to have_field('status', with: 'packaged')
    expect(page).to_not have_field('status', with: 'shipped')
    
    select('shipped', from: 'status')
    click_button "Update Item Status"

    expect(page).to_not have_field('status', with: 'pending')
    expect(page).to have_field('status', with: 'shipped')
  end

  it "get total revenue and discounted revenue" do
    visit "merchants/#{@merchant1.id}/invoices/#{@invoice_1.id}"
    # save_and_open_page
    expect(find("#total_revenue")).to have_content("$4,083.95")
    expect(find("#discounted_revenue")).to have_content("$816.79")
    expect(find("#total_discounted_revenue")).to have_content("$3,267.16")
  end

  it "show link to discount applied to invoice item" do
    visit "merchants/#{@merchant1.id}/invoices/#{@invoice_1.id}"
    expect(find("#invoice_items")).to have_content("This item qualifies for 20 percent off")
    #  save_and_open_page
  end
end