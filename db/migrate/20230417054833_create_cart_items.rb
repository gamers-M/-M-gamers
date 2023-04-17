class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|

      t.timestamps
      t.integer :customer_id
      t.integer :item_id
      t.integer :quantity
    end
  end
end
