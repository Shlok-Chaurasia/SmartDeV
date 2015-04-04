class SignUpController < ApplicationController

  include UserSignInHelper

  def home
  end

  def create_user
    sign_in_param = params.slice(*(UserSignIn.new.attributes.symbolize_keys!.keys + [:password]))
    customer_param = params.slice(*(Customer.new.attributes.symbolize_keys!.keys))
    puts 'sign_in_param'
    puts sign_in_param
    puts 'customer_param'
    puts customer_param
    @new_sign_in = create_new_user(customer_param, sign_in_param)
  end

end