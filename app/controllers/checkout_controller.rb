class CheckoutController < ApplicationController
  def show
   @products = Customer.joins({:customer_order => {:customer_order_detail => {:product_stock=>:product}}}).
        select("product_stocks.id as product_stock_id, product_stocks.*, products.*, customer_order_details.quantity").
        where(:user_sign_in_id => session[:user_id]).
        where("customer_orders.status in ('in_basket')")

  end
end