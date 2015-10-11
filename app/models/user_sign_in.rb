class UserSignIn < ActiveRecord::Base
  has_one :customer
  has_many :address
  validates :user_name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
            uniqueness: { case_sensitive: false }
  has_secure_password

end