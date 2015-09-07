class CustomerOrderDetail < ActiveRecord::Base
  has_one :product_stock
end