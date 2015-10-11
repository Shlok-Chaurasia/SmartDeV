class CustomerAddress < ActiveRecord::Base
  belongs_to :user_sign_in
end