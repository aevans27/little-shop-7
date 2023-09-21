class CreateBulkDiscountTable < ActiveRecord::Migration[7.0]
  def change
    create_table :bulk_discount_tables do |t|
      t.int :discount
      t.int :threshold
      t.references :merchant, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
