class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table  :products do |t|
      t.references :user,               foreign_key: true
      t.integer    :price,              null: false
      t.integer    :freight,            null: false
      t.text       :state_of_goods,     null: false
      t.text       :description,        null: false
      t.string     :name,               null: false
      t.string     :status,             null: false
      t.string     :ship_method,        null: false
      t.string     :ship_from_location, null: false
      t.string     :ship_day,           null: false
      t.timestamps
    end
  end
end
