class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.integer  :product_id,          null: false, foreign_key: true
      t.string   :ship_method,         null: false
      t.string   :ship_from_location,  null: false
      t.string   :ship_day,            null: false
      t.timestamps
    end
  end
end
