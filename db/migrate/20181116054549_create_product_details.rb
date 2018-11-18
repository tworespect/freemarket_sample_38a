class CreateProductDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :product_details do |t|
      t.integer  :product_id,      null: false, foreign_key: true
      t.integer  :freight,         null: false
      t.text     :state_of_goods,  null: false
      t.text     :description,     null: false
      t.timestamps
    end
  end
end
