class OrderDetail < ApplicationRecord
  enum making_status: { cannot_start: 0, waiting_for_production: 1,
  in_production: 2, completion_of_production: 3 }
end
