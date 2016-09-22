class CreatePreSaleCustomerPages < ActiveRecord::Migration
  def change
    create_table :pre_sale_customer_pages do |t|
      t.string :slug, null: false, default: ''
      t.string :banner, null: false, default: ''
      t.string :video, null: false, default: ''
      t.text :observations

      t.timestamps null: false
    end
  end
end
