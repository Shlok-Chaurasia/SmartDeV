class Customer < ActiveRecord::Base
  belongs_to :user_sign_in
  has_many :customer_order
  validates :name, presence: true, length: { maximum: 50 }
  validates :phone, presence: true, length: { maximum: 10 }

end