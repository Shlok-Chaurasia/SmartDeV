class UserSignInController < ApplicationController

  include UserSignInHelper

  def home
  end

  def create
    sign_in_param = params.slice(*(UserSignIn.new.attributes.symbolize_keys!.keys + [:password]))
    customer_param = params.slice(*(Customer.new.attributes.symbolize_keys!.keys))
    new_customer = Customer.new(customer_param)
    @user_sign_in = UserSignIn.new(sign_in_param.merge(:customer => new_customer))
    begin
      @user_sign_in.save!
    rescue Exception => e
      @user_sign_in = e.message
    end
    puts '@user_sign_in'
    puts @user_sign_in
    respond_to do |format|
      format.json {render json: @user_sign_in}
    end
  end

end