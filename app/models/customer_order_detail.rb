class CustomerOrderDetail < ActiveRecord::Base
  belongs_to :product_stock
  belongs_to :customer_order
end