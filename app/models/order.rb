class Order < ApplicationRecord
  has_many :order_details
  belongs_to :customer
  enum payment_method: { credit_card: 0, transfer: 1 }

  enum status: { waiting_for_production: 0, payment_confirmation: 1, in_production: 2, shipping_preparation: 3, sent: 4 }

  def address_display
   '〒' + postcode + ' ' + address + ' ' + name
  end

end
