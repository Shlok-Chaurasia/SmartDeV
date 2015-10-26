class SlotsController < ApplicationController

  def show_slot
    @address = CustomerAddress.find_by_id!(params[:address_id])
    puts 'show_slots session[:user_id]'
    puts session[:user_id]
    @slots = Slot.where(:zipcode => @address.zipcode).where('slot_date_time between ? and ?', Time.now.to_s, (Time.now + 1.days).to_s)
  end

  def place_order
    user_id = session[:user_id]
    puts 'user_id'
    puts session[:user_id]
    puts user_id
    puts session
    puts cookies[:user_id]
    customer_order_id = CustomerOrder.joins(:customer).where(:customers =>{:user_sign_in_id => user_id}, :status => 'in_basket').first.id

    CustomerOrder.where(:id => customer_order_id).first.update_attributes!(:status => 'order_placed')
    @slot = Slot.find_by_id(params[:slot_id])
    @address = CustomerAddress.find_by_id!(params[:address_id])
  end

  def save_address
    puts 'params'
    puts params
    customer_add = CustomerAddress.create!(:user_id => session[:user_id], :address => [params["flat_num"],params["street_add"]].join(" "),
                            :landmark => params["landmark"], :phone=>params["phone_num"],:zipcode => params["pincode"])
    redirect_to action: "show_slot", address_id: customer_add.id
  end
end