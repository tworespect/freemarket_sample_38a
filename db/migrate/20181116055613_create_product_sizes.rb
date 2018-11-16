class CreateProductSizes < ActiveRecord::Migration[5.2]
  def change
    create_table :product_sizes do |t|
      t.integer  :product_id,    null: false, foreign_key: true
      t.integer  :size_id,       null: false
      t.timestamps
    end
  end
end
