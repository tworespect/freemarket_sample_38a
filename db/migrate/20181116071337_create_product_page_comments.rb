class CreateProductPageComments < ActiveRecord::Migration[5.2]
  def change
    create_table :product_page_comments do |t|
      t.integer    :product_id, foreign_key: true
      t.references :user,       foreign_key: true
      t.text       :text,       null: false
      t.timestamps
    end
  end
end
