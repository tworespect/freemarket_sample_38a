class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.references  :product,     foreign_key: true
      t.string      :first_image, null: false
      t.string      :second_image
      t.string      :third_image
      t.string      :forth_image
      t.timestamps
    end
  end
end
