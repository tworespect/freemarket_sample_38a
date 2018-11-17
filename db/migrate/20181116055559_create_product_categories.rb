class CreateProductCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :product_categories do |t|
      t.integer  :product_id,   null: false, foreign_key: true
      t.string   :name,         null: false
      t.timestamps
    end
  end
end
