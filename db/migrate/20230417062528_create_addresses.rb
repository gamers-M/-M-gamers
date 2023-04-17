class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.integer :customer_id, null: false
      t.string :postcode, null: false
      t.string :addresses, null: false
      t.string :name, null: false

      
    end
  end
end
