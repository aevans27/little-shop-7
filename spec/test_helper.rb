def load_test_data
  @merchant1= Merchant.create!(name: "No Face")
  @merchant2 = Merchant.create!(name: "Totoro")
  @merchant3 = Merchant.create!(name: "Kiki")
  @merchant4= Merchant.create!(name: "Howl")
  @merchant5 = Merchant.create!(name: "Calcifer")
  @merchant6= Merchant.create!(name: "Ashitaka")
  @merchant7= Merchant.create!(name: "Catbus")
  @merchant8= Merchant.create!(name: "Haku")
  @merchant9= Merchant.create!(name: "Chihiro")
  @merchant10= Merchant.create!(name: "Mononoke")

  @discount1= BulkDiscount.create!(discount:20, threshold:10, merchant:@merchant1)
  @discount2= BulkDiscount.create!(discount:30, threshold:20, merchant:@merchant1)
  @discount3= BulkDiscount.create!(discount:40, threshold:40, merchant:@merchant1)
  @discount4= BulkDiscount.create!(discount:20, threshold:10, merchant:@merchant2)
  @discount5= BulkDiscount.create!(discount:30, threshold:20, merchant:@merchant2)
  @discount6= BulkDiscount.create!(discount:40, threshold:40, merchant:@merchant2)
  @discount7= BulkDiscount.create!(discount:20, threshold:10, merchant:@merchant1)
  @discount8= BulkDiscount.create!(discount:30, threshold:15, merchant:@merchant1)
  @discount9= BulkDiscount.create!(discount:40, threshold:20, merchant:@merchant1)

  @customer_1 = Customer.create!(first_name: "Frodo", last_name: "Baggins")
  @customer_2 = Customer.create!(first_name: "Samwise", last_name: "Gamgee")
  @customer_3 = Customer.create!(first_name: "Meridoc", last_name: "Brandybuck")
  @customer_4 = Customer.create!(first_name: "Perigrin", last_name: "Took")
  @customer_5 = Customer.create!(first_name: "Bilbo", last_name: "Baggins")
  @customer_6 = Customer.create!(first_name: "Legolas", last_name: "Greenleaf")
  @customer_7 = Customer.create!(first_name: "Gimli", last_name: "Son of Gloin")
  @customer_8 = Customer.create!(first_name: "Galdalf", last_name: "The Grey")
  @customer_9 = Customer.create!(first_name: "Aragorn", last_name: "Elessar")
  @customer_10 = Customer.create!(first_name: "Boromir", last_name: "Son of Denethor II")
  @customer_11 = Customer.create!(first_name: "King", last_name: "Boo")
  @customer_12 = Customer.create!(first_name: "Mario", last_name: "Mario")
  @customer_13 = Customer.create!(first_name: "Luigi", last_name: "Mario")
  @customer_14 = Customer.create!(first_name: "Koopa", last_name: "Troopa")
  @customer_15 = Customer.create!(first_name: "Loki", last_name: "Karl")

  @invoice_1 = Invoice.create!(status: "cancelled", customer: @customer_1, updated_at: "2023-04-27 14:54:09 UTC")
  @invoice_1a = Invoice.create!(status: "cancelled", customer: @customer_1, updated_at: "2023-05-27 14:54:09 UTC")
  @invoice_1b = Invoice.create!(status: "cancelled", customer: @customer_1, updated_at: "2023-06-27 14:54:09 UTC")
  @invoice_1c = Invoice.create!(status: "cancelled", customer: @customer_1, updated_at: "2023-07-27 14:54:09 UTC")
  @invoice_1d = Invoice.create!(status: "cancelled", customer: @customer_1, updated_at: "2023-08-27 14:54:09 UTC")
  @invoice_1e = Invoice.create!(status: "cancelled", customer: @customer_1, updated_at: "2023-09-27 14:54:09 UTC")
  @invoice_1f = Invoice.create!(status: "completed", customer: @customer_1, updated_at: "2023-10-27 14:54:09 UTC")
  @invoice_1g = Invoice.create!(status: "completed", customer: @customer_1, updated_at: "2023-11-27 14:54:09 UTC")
  @invoice_1h = Invoice.create!(status: "completed", customer: @customer_1, updated_at: "2023-12-27 14:54:09 UTC")
  @invoice_1i = Invoice.create!(status: "completed", customer: @customer_1, updated_at: "2023-03-26 14:54:09 UTC")
  @invoice_1j = Invoice.create!(status: "completed", customer: @customer_1, updated_at: "2023-03-25 14:54:09 UTC")
  @invoice_1k = Invoice.create!(status: "completed", customer: @customer_1, updated_at: "2023-03-24 14:54:09 UTC")
  @invoice_1l = Invoice.create!(status: "completed", customer: @customer_1, updated_at: "2023-03-23 14:54:09 UTC")
  @invoice_2a = Invoice.create!(status: "in progress", customer: @customer_2, updated_at: "2023-03-22 14:54:09 UTC")
  @invoice_2b = Invoice.create!(status: "in progress", customer: @customer_2, updated_at: "2023-03-21 14:54:09 UTC")
  @invoice_2c = Invoice.create!(status: "in progress", customer: @customer_2, updated_at: "2023-03-20 14:54:09 UTC")
  @invoice_2d = Invoice.create!(status: "in progress", customer: @customer_2, updated_at: "2023-03-19 14:54:09 UTC")
  @invoice_3a = Invoice.create!(status: "cancelled", customer: @customer_3, updated_at: "2023-03-20 14:54:09 UTC")
  @invoice_3b = Invoice.create!(status: "cancelled", customer: @customer_3, updated_at: "2023-03-19 14:54:09 UTC")
  @invoice_3c = Invoice.create!(status: "cancelled", customer: @customer_3, updated_at: "2023-03-11 14:54:09 UTC")
  @invoice_3d = Invoice.create!(status: "cancelled", customer: @customer_3, updated_at: "2023-03-12 14:54:09 UTC")
  @invoice_4a  = Invoice.create!(status: "completed", customer: @customer_4, updated_at: "2023-03-13 14:54:09 UTC")
  @invoice_4b  = Invoice.create!(status: "completed", customer: @customer_4, updated_at: "2023-03-14 14:54:09 UTC")
  @invoice_4c  = Invoice.create!(status: "completed", customer: @customer_4, updated_at: "2023-03-15 14:54:09 UTC")
  @invoice_4d  = Invoice.create!(status: "completed", customer: @customer_4, updated_at: "2023-03-16 14:54:09 UTC")
  @invoice_5a  = Invoice.create!(status: "completed", customer: @customer_5, updated_at: "2023-03-17 14:54:09 UTC")
  @invoice_5b  = Invoice.create!(status: "completed", customer: @customer_5, updated_at: "2023-03-18 14:54:09 UTC")
  @invoice_5c  = Invoice.create!(status: "completed", customer: @customer_5, updated_at: "2023-03-19 14:54:09 UTC")
  @invoice_5d  = Invoice.create!(status: "completed", customer: @customer_5, updated_at: "2023-03-10 14:54:09 UTC")
  @invoice_6a  = Invoice.create!(status: "cancelled", customer: @customer_6, updated_at: "2023-03-27 14:54:09 UTC")
  @invoice_6b  = Invoice.create!(status: "cancelled", customer: @customer_6, updated_at: "2023-03-27 14:54:09 UTC")
  @invoice_7  = Invoice.create!(status: "completed", customer: @customer_7, updated_at: "2023-03-27 14:54:09 UTC")
  @invoice_8  = Invoice.create!(status: "in progress", customer: @customer_8, updated_at: "2023-03-27 14:54:09 UTC")
  @invoice_9  = Invoice.create!(status: "completed", customer: @customer_9, updated_at: "2023-03-27 14:54:09 UTC")
  @invoice_10  = Invoice.create!(status: "in progress", customer: @customer_10, updated_at: "2023-03-27 14:54:09 UTC")
  @invoice_11  = Invoice.create!(status: "in progress", customer: @customer_11, updated_at: "2023-03-27 14:54:09 UTC")

  @item1 = Item.create!(name: "Colgate", description: "toothpaste", unit_price: 400, merchant: @merchant1) 
  @item2 = Item.create!(name: "Red Bell Pepper", description: "Vegetable", unit_price: 200, merchant: @merchant1) 
  @item3 = Item.create!(name: "Huskies", description: "dog food", unit_price: 200, merchant: @merchant1) 
  @item4 = Item.create!(name: "Gatorade", description: "drink", unit_price: 200, merchant: @merchant1) 
  @item5 = Item.create!(name: "Pretzels", description: "snack", unit_price: 400, merchant: @merchant1) 
  @item6 = Item.create!(name: "Chicken Breast", description: "meat", unit_price: 500, merchant: @merchant1) 
  @item7 = Item.create!(name: "Coors", description: "alcohol", unit_price: 200, merchant: @merchant1) 
  @item8 = Item.create!(name: "Colgate", description: "toothpaste", unit_price: 400, merchant: @merchant2) 
  @item9 = Item.create!(name: "Red Bell Pepper", description: "Vegetable", unit_price: 200, merchant: @merchant2) 
  @item10 = Item.create!(name: "Huskies", description: "dog food", unit_price: 2000, merchant: @merchant2) 
  @item11 = Item.create!(name: "Gatorade", description: "drink", unit_price: 200, merchant: @merchant2) 
  @item12 = Item.create!(name: "Pretzels", description: "snack", unit_price: 400, merchant: @merchant2) 
  @item13= Item.create!(name: "Chicken Breast", description: "meat", unit_price: 500, merchant: @merchant2) 
  @item14= Item.create!(name: "Coors", description: "alcohol", unit_price: 200, merchant: @merchant2) 
  @item15 = Item.create!(name: "Colgate", description: "toothpaste", unit_price: 400, merchant: @merchant3) 
  @item16 = Item.create!(name: "Red Bell Pepper", description: "Vegetable", unit_price: 200, merchant: @merchant3) 
  @item17 = Item.create!(name: "Huskies", description: "dog food", unit_price: 2000, merchant: @merchant3) 
  @item18 = Item.create!(name: "Gatorade", description: "drink", unit_price: 200, merchant: @merchant3) 
  @item19 = Item.create!(name: "Pretzels", description: "snack", unit_price: 400, merchant: @merchant3) 
  @item20 = Item.create!(name: "Chicken Breast", description: "meat", unit_price: 500, merchant: @merchant3) 
  @item21 = Item.create!(name: "Coors", description: "alcohol", unit_price: 200, merchant: @merchant3) 
  @item22 = Item.create!(name: "Colgate", description: "toothpaste", unit_price: 400, merchant: @merchant4) 
  @item23 = Item.create!(name: "Red Bell Pepper", description: "Vegetable", unit_price: 200, merchant: @merchant4) 
  @item24 = Item.create!(name: "Huskies", description: "dog food", unit_price: 2000, merchant: @merchant4) 
  @item25 = Item.create!(name: "Gatorade", description: "drink", unit_price: 200, merchant: @merchant4) 
  @item26 = Item.create!(name: "Pretzels", description: "snack", unit_price: 400, merchant: @merchant4) 
  @item27 = Item.create!(name: "Chicken Breast", description: "meat", unit_price: 500, merchant: @merchant4) 
  @item28 = Item.create!(name: "Coors", description: "alcohol", unit_price: 200, merchant: @merchant4) 
  @item29 = Item.create!(name: "Coors", description: "alcohol", unit_price: 200, merchant: @merchant5) 
  @item30 = Item.create!(name: "Coors", description: "alcohol", unit_price: 200, merchant: @merchant5) 
  @item31 = Item.create!(name: "Coors", description: "alcohol", unit_price: 200, merchant: @merchant5) 
  @item32 = Item.create!(name: "Coors", description: "alcohol", unit_price: 200, merchant: @merchant5) 
  @item33 = Item.create!(name: "Coors", description: "alcohol", unit_price: 200, merchant: @merchant5) 
  @item34 = Item.create!(name: "Coors", description: "alcohol", unit_price: 200, merchant: @merchant5) 
  @item35 = Item.create!(name: "Coors", description: "alcohol", unit_price: 200, merchant: @merchant5)
  @item36 = Item.create!(name: "Mug", description: "a thing to drink from", unit_price: 200, merchant: @merchant1) 
  @item37 = Item.create!(name: "Book", description: "a thing to read from", unit_price: 500, merchant: @merchant2) 
  @item38 = Item.create!(name: "Card", description: "a thing to write on", unit_price: 200, merchant: @merchant3) 
  @item39 = Item.create!(name: "Bag", description: "a thing to hold stuff in", unit_price: 200, merchant: @merchant4) 
  @item40 = Item.create!(name: "Keychain", description: "a thing to hold ur keys", unit_price: 100, merchant: @merchant5) 
  @item41 = Item.create!(name: "Lamp", description: "a thing to light up ur room", unit_price: 800, merchant: @merchant6) 
  @item42 = Item.create!(name: "Mouse", description: "a thing for ur cat to chase", unit_price: 800, merchant: @merchant7) 
  @item44 = Item.create!(name: "Clip", description: "a thing for clip stuff together", unit_price: 200, merchant: @merchant8) 
  @item45 = Item.create!(name: "Shelf", description: "a thing to set ur stuff on", unit_price: 1000, merchant: @merchant9) 
  @item46 = Item.create!(name: "Hook", description: "a thing hang ur stuff on", unit_price: 800, merchant: @merchant10)

  @invoice_items1 = InvoiceItem.create!(quantity: 13, unit_price: 31415, status: "pending", item: @item1, invoice: @invoice_1a )
  @invoice_items2 = InvoiceItem.create!(quantity: 13, unit_price: 31415, status: "packaged", item: @item1, invoice: @invoice_1 )
  @invoice_items3 = InvoiceItem.create!(quantity: 13, unit_price: 31415, status: "shipped", item: @item2, invoice: @invoice_1b )
  @invoice_items4 = InvoiceItem.create!(quantity: 13, unit_price: 31415, status: "packaged", item: @item3, invoice: @invoice_1c)
  @invoice_items5 = InvoiceItem.create!(quantity: 13, unit_price: 31415, status: "pending", item: @item4, invoice: @invoice_1e )
  @invoice_items6 = InvoiceItem.create!(quantity: 13, unit_price: 31415, status: "pending", item: @item5, invoice: @invoice_2a )
  @invoice_items7 = InvoiceItem.create!(quantity: 13, unit_price: 31415, status: "shipped", item: @item6, invoice: @invoice_2b )
  @invoice_items8 = InvoiceItem.create!(quantity: 13, unit_price: 31415, status: "shipped", item: @item7, invoice: @invoice_2c)
  @invoice_items9 = InvoiceItem.create!(quantity: 13, unit_price: 31415, status: "shipped", item: @item8, invoice: @invoice_2d )
  @invoice_items10 = InvoiceItem.create!(quantity: 13, unit_price: 31415, status: "shipped", item: @item8, invoice: @invoice_3a )
  @invoice_items11 = InvoiceItem.create!(quantity: 13, unit_price: 31415, status: "shipped", item: @item9, invoice: @invoice_3b )
  @invoice_items12 = InvoiceItem.create!(quantity: 13, unit_price: 31415, status: "shipped", item: @item10, invoice: @invoice_3c )
  @invoice_items13 = InvoiceItem.create!(quantity: 13, unit_price: 31415, status: "shipped", item: @item11, invoice: @invoice_3d )
  @invoice_items14 = InvoiceItem.create!(quantity: 13, unit_price: 31415, status: "shipped", item: @item12, invoice: @invoice_4a )
  @invoice_items15 = InvoiceItem.create!(quantity: 13, unit_price: 31415, status: "shipped", item: @item14, invoice: @invoice_4b )
  @invoice_items16 = InvoiceItem.create!(quantity: 13, unit_price: 31415, status: "shipped", item: @item15, invoice: @invoice_4c )
  @invoice_items17 = InvoiceItem.create!(quantity: 13, unit_price: 31415, status: "shipped", item: @item16, invoice: @invoice_4d)
  @invoice_items18 = InvoiceItem.create!(quantity: 13, unit_price: 31415, status: "shipped", item: @item17, invoice: @invoice_5a )
  @invoice_items19 = InvoiceItem.create!(quantity: 13, unit_price: 31415, status: "shipped", item: @item18, invoice: @invoice_5b )
  @invoice_items20 = InvoiceItem.create!(quantity: 13, unit_price: 31415, status: "shipped", item: @item19, invoice: @invoice_5c )
  @invoice_items21 = InvoiceItem.create!(quantity: 13, unit_price: 31415, status: "shipped", item: @item20, invoice: @invoice_5d )
  @invoice_items22 = InvoiceItem.create!(quantity: 13, unit_price: 31415, status: "shipped", item: @item21, invoice: @invoice_6a )
  @invoice_items23 = InvoiceItem.create!(quantity: 13, unit_price: 31415, status: "shipped", item: @item22, invoice: @invoice_6b )
  @invoice_items24 = InvoiceItem.create!(quantity: 13, unit_price: 31415, status: "shipped", item: @item23, invoice: @invoice_7 )
  @invoice_items25 = InvoiceItem.create!(quantity: 13, unit_price: 31415, status: "shipped", item: @item24, invoice: @invoice_8 )
  @invoice_items26 = InvoiceItem.create!(quantity: 13, unit_price: 31415, status: "shipped", item: @item25, invoice: @invoice_9 )
  @invoice_items27 = InvoiceItem.create!(quantity: 13, unit_price: 31415, status: "shipped", item: @item26, invoice: @invoice_10 )
  @invoice_items28 = InvoiceItem.create!(quantity: 13, unit_price: 31415, status: "shipped", item: @item27, invoice: @invoice_11 )
  @invoice_items29 = InvoiceItem.create!(quantity: 13, unit_price: 31415, status: "shipped", item: @item28, invoice: @invoice_1f )
  @invoice_items30 = InvoiceItem.create!(quantity: 13, unit_price: 31415, status: "shipped", item: @item29, invoice: @invoice_1g )
  @invoice_items31 = InvoiceItem.create!(quantity: 13, unit_price: 31415, status: "shipped", item: @item30, invoice: @invoice_1h )
  @invoice_items32 = InvoiceItem.create!(quantity: 13, unit_price: 31415, status: "shipped", item: @item31, invoice: @invoice_1i )
  @invoice_items33 = InvoiceItem.create!(quantity: 13, unit_price: 31415, status: "shipped", item: @item32, invoice: @invoice_1j )
  @invoice_items34 = InvoiceItem.create!(quantity: 13, unit_price: 31415, status: "shipped", item: @item33, invoice: @invoice_1k )

  @invoice_items35 = InvoiceItem.create!(quantity: 13, unit_price: 31415, status: "shipped", item: @item1, invoice: @invoice_1a )
  @invoice_items36 = InvoiceItem.create!(quantity: 13, unit_price: 31415, status: "shipped", item: @item2, invoice: @invoice_1a )
  @invoice_items37 = InvoiceItem.create!(quantity: 13, unit_price: 31415, status: "shipped", item: @item3, invoice: @invoice_1a )
  @invoice_items38 = InvoiceItem.create!(quantity: 13, unit_price: 31415, status: "shipped", item: @item4, invoice: @invoice_1a )
  @invoice_items39 = InvoiceItem.create!(quantity: 13, unit_price: 31415, status: "shipped", item: @item5, invoice: @invoice_1a )
  
  @transaction_1f = Transaction.create!(invoice: @invoice_1e, credit_card_number: "123456789012", credit_card_expiration_date: "01/24", result: "failed")
  @transaction_2 = Transaction.create!(invoice: @invoice_1f, credit_card_number: "234567890102", credit_card_expiration_date: "02/24", result: "success")
  @transaction_3 = Transaction.create!(invoice: @invoice_1g, credit_card_number: "234567890102", credit_card_expiration_date: "02/24", result: "success")
  @transaction_4 = Transaction.create!(invoice: @invoice_1h, credit_card_number: "234567890102", credit_card_expiration_date: "02/24", result: "success")
  @transaction_5f = Transaction.create!(invoice: @invoice_1i, credit_card_number: "234567890102", credit_card_expiration_date: "02/24", result: "failed")
  @transaction_5 = Transaction.create!(invoice: @invoice_1i, credit_card_number: "234567890102", credit_card_expiration_date: "02/24", result: "success")
  @transaction_6 = Transaction.create!(invoice: @invoice_2a, credit_card_number: "234567890102", credit_card_expiration_date: "02/24", result: "success")
  @transaction_7 = Transaction.create!(invoice: @invoice_2b, credit_card_number: "234567890102", credit_card_expiration_date: "02/24", result: "success")
  @transaction_8 = Transaction.create!(invoice: @invoice_2c, credit_card_number: "234567890102", credit_card_expiration_date: "02/24", result: "success")
  @transaction_9 = Transaction.create!(invoice: @invoice_2d, credit_card_number: "234567890102", credit_card_expiration_date: "02/24", result: "success")
  @transaction_10 = Transaction.create!(invoice: @invoice_3a, credit_card_number: "234567890102", credit_card_expiration_date: "02/24", result: "success")
  @transaction_11 = Transaction.create!(invoice: @invoice_3b, credit_card_number: "234567890102", credit_card_expiration_date: "02/24", result: "success")
  @transaction_12 = Transaction.create!(invoice: @invoice_3c, credit_card_number: "234567890102", credit_card_expiration_date: "02/24", result: "success")
  @transaction_13 = Transaction.create!(invoice: @invoice_3d, credit_card_number: "234567890102", credit_card_expiration_date: "02/24", result: "success")
  @transaction_14 = Transaction.create!(invoice: @invoice_4a, credit_card_number: "234567890102", credit_card_expiration_date: "02/24", result: "success")
  @transaction_15 = Transaction.create!(invoice: @invoice_4b, credit_card_number: "234567890102", credit_card_expiration_date: "02/24", result: "success")
  @transaction_16 = Transaction.create!(invoice: @invoice_4c, credit_card_number: "234567890102", credit_card_expiration_date: "02/24", result: "success")
  @transaction_17 = Transaction.create!(invoice: @invoice_4d, credit_card_number: "234567890102", credit_card_expiration_date: "02/24", result: "success")
  @transaction_18 = Transaction.create!(invoice: @invoice_5a, credit_card_number: "234567890102", credit_card_expiration_date: "02/24", result: "success")
end 

def load_best_test_data
  @merchant1= Merchant.create!(name: "No Face")
  @merchant2 = Merchant.create!(name: "Totoro")
  @merchant3 = Merchant.create!(name: "Kiki")
  @merchant4= Merchant.create!(name: "Howl")
  @merchant5 = Merchant.create!(name: "Calcifer")
  @merchant6= Merchant.create!(name: "Ashitaka")
  @merchant7= Merchant.create!(name: "Catbus")
  @merchant8= Merchant.create!(name: "Haku")
  @merchant9= Merchant.create!(name: "Chihiro")
  @merchant10= Merchant.create!(name: "Mononoke")

  @customer_1 = Customer.create!(first_name: "Frodo", last_name: "Baggins")

  @invoice_1 = Invoice.create!(status: "completed", customer: @customer_1, updated_at: "2023-03-27 14:54:09 UTC")
  @invoice_2 = Invoice.create!(status: "completed", customer: @customer_1, updated_at: "2023-03-27 14:54:09 UTC")
  @invoice_3 = Invoice.create!(status: "completed", customer: @customer_1, updated_at: "2023-03-27 14:54:09 UTC")
  @invoice_4 = Invoice.create!(status: "completed", customer: @customer_1, updated_at: "2023-03-27 14:54:09 UTC")
  @invoice_5 = Invoice.create!(status: "completed", customer: @customer_1, updated_at: "2023-03-27 14:54:09 UTC")
  @invoice_6 = Invoice.create!(status: "completed", customer: @customer_1, updated_at: "2023-03-27 14:54:09 UTC")
  @invoice_7 = Invoice.create!(status: "completed", customer: @customer_1, updated_at: "2023-01-27 14:54:09 UTC")
  @invoice_8 = Invoice.create!(status: "cancelled", customer: @customer_1, updated_at: "2023-03-27 14:54:09 UTC")
  @invoice_9 = Invoice.create!(status: "completed", customer: @customer_1, updated_at: "2023-03-27 14:54:09 UTC")
  @invoice_10 = Invoice.create!(status: "completed", customer: @customer_1, updated_at: "2023-03-27 14:54:09 UTC")
  @invoice_11 = Invoice.create!(status: "completed", customer: @customer_1, updated_at: "2023-03-27 14:54:09 UTC")
  @invoice_12 = Invoice.create!(status: "completed", customer: @customer_1, updated_at: "2023-03-27 14:54:09 UTC")
  @invoice_13 = Invoice.create!(status: "completed", customer: @customer_1, updated_at: "2023-03-27 14:54:09 UTC")
  @invoice_14 = Invoice.create!(status: "completed", customer: @customer_1, updated_at: "2023-03-27 14:54:09 UTC")

  @item1 = Item.create!(name: "Colgate", description: "toothpaste", unit_price: 400, merchant: @merchant1) 
  @item2 = Item.create!(name: "Red Bell Pepper", description: "Vegetable", unit_price: 200, merchant: @merchant2) 
  @item3 = Item.create!(name: "Huskies", description: "dog food", unit_price: 200, merchant: @merchant3) 
  @item4 = Item.create!(name: "Gatorade", description: "drink", unit_price: 200, merchant: @merchant4) 
  @item5 = Item.create!(name: "Pretzels", description: "snack", unit_price: 400, merchant: @merchant5) 
  @item6 = Item.create!(name: "Chicken Breast", description: "meat", unit_price: 500, merchant: @merchant6) 
  @item7 = Item.create!(name: "Coors", description: "alcohol", unit_price: 200, merchant: @merchant7) 
  @item8 = Item.create!(name: "Colgate", description: "toothpaste", unit_price: 400, merchant: @merchant8) 
  @item9 = Item.create!(name: "Red Bell Pepper", description: "Vegetable", unit_price: 200, merchant: @merchant9) 
  @item10 = Item.create!(name: "Huskies", description: "dog food", unit_price: 2000, merchant: @merchant10) 
  

  @invoice_items1 = InvoiceItem.create!(quantity: 10, unit_price: 10, status: "pending", item: @item2, invoice: @invoice_1 )
  @invoice_items2 = InvoiceItem.create!(quantity: 10, unit_price: 10, status: "packaged", item: @item2, invoice: @invoice_2 )
  @invoice_items3 = InvoiceItem.create!(quantity: 10, unit_price: 10, status: "shipped", item: @item2, invoice: @invoice_3 )
  @invoice_items4 = InvoiceItem.create!(quantity: 10, unit_price: 10, status: "packaged", item: @item3, invoice: @invoice_4)
  @invoice_items5 = InvoiceItem.create!(quantity: 10, unit_price: 10, status: "pending", item: @item3, invoice: @invoice_5 )
  @invoice_items6 = InvoiceItem.create!(quantity: 10, unit_price: 5, status: "pending", item: @item3, invoice: @invoice_5 )
  @invoice_items7 = InvoiceItem.create!(quantity: 10, unit_price: 10, status: "shipped", item: @item5, invoice: @invoice_6 )
  @invoice_items8 = InvoiceItem.create!(quantity: 10, unit_price: 10, status: "shipped", item: @item5, invoice: @invoice_7)
  @invoice_items9 = InvoiceItem.create!(quantity: 10, unit_price: 10, status: "shipped", item: @item6, invoice: @invoice_8 ) #
  @invoice_items10 = InvoiceItem.create!(quantity: 10, unit_price: 10, status: "shipped", item: @item7, invoice: @invoice_9 )
  @invoice_items11 = InvoiceItem.create!(quantity: 10, unit_price: 10, status: "shipped", item: @item7, invoice: @invoice_10)
  @invoice_items12 = InvoiceItem.create!(quantity: 10, unit_price: 10, status: "shipped", item: @item1, invoice: @invoice_11 )
  @invoice_items13 = InvoiceItem.create!(quantity: 10, unit_price: 9, status: "shipped", item: @item8, invoice: @invoice_12 )
  @invoice_items14 = InvoiceItem.create!(quantity: 10, unit_price: 8, status: "shipped", item: @item10, invoice: @invoice_13 )

  @transaction_1 = Transaction.create!(invoice: @invoice_1, credit_card_number: "234567890102", credit_card_expiration_date: "02/24", result: "success")
  @transaction_2 = Transaction.create!(invoice: @invoice_2, credit_card_number: "234567890102", credit_card_expiration_date: "02/24", result: "success")
  @transaction_3 = Transaction.create!(invoice: @invoice_3, credit_card_number: "234567890102", credit_card_expiration_date: "02/24", result: "success")
  @transaction_4 = Transaction.create!(invoice: @invoice_4, credit_card_number: "234567890102", credit_card_expiration_date: "02/24", result: "success")
  @transaction_5 = Transaction.create!(invoice: @invoice_5, credit_card_number: "234567890102", credit_card_expiration_date: "02/24", result: "success")
  @transaction_6 = Transaction.create!(invoice: @invoice_6, credit_card_number: "234567890102", credit_card_expiration_date: "02/24", result: "success")
  @transaction_7 = Transaction.create!(invoice: @invoice_7, credit_card_number: "234567890102", credit_card_expiration_date: "02/24", result: "success")
  @transaction_8 = Transaction.create!(invoice: @invoice_8, credit_card_number: "234567890102", credit_card_expiration_date: "02/24", result: "failed")
  @transaction_9 = Transaction.create!(invoice: @invoice_9, credit_card_number: "234567890102", credit_card_expiration_date: "02/24", result: "success")
  @transaction_10 = Transaction.create!(invoice: @invoice_10, credit_card_number: "234567890102", credit_card_expiration_date: "02/24", result: "success")
  @transaction_11 = Transaction.create!(invoice: @invoice_11, credit_card_number: "234567890102", credit_card_expiration_date: "02/24", result: "success")
  @transaction_12 = Transaction.create!(invoice: @invoice_12, credit_card_number: "234567890102", credit_card_expiration_date: "02/24", result: "success")
  @transaction_13 = Transaction.create!(invoice: @invoice_13, credit_card_number: "234567890102", credit_card_expiration_date: "02/24", result: "success")
end 