class Product < ActiveRecord::Base
  has_many :product_stocks
end