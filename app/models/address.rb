class Address < ApplicationRecord
  belongs_to :customer

  def address_display
   '〒' + postcode + ' ' + addresses + ' ' + name
  end
end