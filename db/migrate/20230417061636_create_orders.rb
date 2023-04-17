class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.customer_id :integer, null: false
      t.address :string, null: false
      postcode :string, null: false
      name :string, null: false
      status :integer, null: false, default: 0
      postage :integer, null: false
      billing_amount :integer, null: false
      payment_method :integer, null: false, default: 0

      t.timestamps
    end
  end
end
