class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.references :user, foreign_key: true, null: false
      t.string :payjp_customer_id, null: false, unique: true
      t.timestamps
    end
  end
end
