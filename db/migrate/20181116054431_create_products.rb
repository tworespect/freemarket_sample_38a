class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer    :user_id,  null: false, unique: true, index:true
      t.integer    :price,    null: false
      t.string     :name,     null: false
      t.string     :status,   null: false
      t.timestamps
    end
  end
end
