class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.integer  :product_id,          null: false, foreign_key: true
      t.string   :first_image,         null: false
      t.text     :second_image,        null: false
      t.text     :third_image,         null: false
      t.text     :forth_image,         null: false
      t.timestamps
    end
  end
end
