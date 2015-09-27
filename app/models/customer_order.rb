class CustomerOrder < ActiveRecord::Base
  belongs_to :customer
  has_many :customer_order_detail
end