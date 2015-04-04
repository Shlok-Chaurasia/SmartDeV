
module UserSignInHelper

  def create_new_user(customer_param, user_sign_in_param)
    new_customer = Customer.new(customer_param)
    new_sign_in = UserSignIn.new(user_sign_in_param.merge(:customer => new_customer))
    new_sign_in.save!
    new_sign_in
  end

end