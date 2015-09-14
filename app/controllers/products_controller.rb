class ProductsController < ApplicationController
  def product
    @all_product_count ||= Product.count
    puts "params['page_number']"
    puts params['page_number']
    if params['page_number'].nil?
      @products = Product.order(:id).limit(12)
    else
      @products = Product.order(:id).limit(12).offset(12*params['page_number'].to_i)
    end
  end

  def partial_page
    puts "params['page_number'].to_i", params['page_number'].to_i
    @products = Product.order(:id).limit(12).offset(12 * params['page_number'].to_i)
  end

  def add_product
    product_id=params["product_id"]
    stock_id=params["stock_id"]
    customer = Customer.where(:user_sign_in_id => session[:user_id]).first
    if customer.present?
      customer_order = CustomerOrder.where(:customers_id => customer.id, :status => 'in_basket').first
      if customer_order.present?
        puts 'login_to_site'
        CustomerOrderDetail.create!(:customer_orders_id => customer_order.id)
        render :nothing => true, :status => 200, :content_type => 'json'
      else
        ActiveRecord::Base.transaction do
          customer_order = CustomerOrder.create!(:customers_id => customer.id, :status => 'in_basket')
          CustomerOrderDetail.create!(:customer_orders_id => customer_order.id)
          render :nothing => true, :status => 200, :content_type => 'json'
        end
      end
    end

  end

end