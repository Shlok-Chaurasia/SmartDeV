class ProductsController < ApplicationController
  def product
    @all_product_count ||= Product.count
    puts "params['page_number']"
    puts params['page_number']

    if params['page_number'].nil?
      @page_number = 0
      @products = Product.order(:id).limit(12)
    else
      @page_number = params['page_number']
      @products = Product.order(:id).limit(12).offset(12*params['page_number'].to_i)
    end
    prod_qty = Customer.joins({:customer_order => {:customer_order_detail => {:product_stock => :product}}}).
        where(:user_sign_in_id => session[:user_id]).
        where("customer_orders.status in ('in_basket')").
        select("products.id as prod_id, product_stocks.id as prod_stock_id, customer_order_details.quantity as qty")
    @prod_detail = {}
    puts "prod_qty.inspect"
    puts prod_qty.inspect
    prod_qty.each do |prod|
      puts prod.prod_id, prod.prod_stock_id, prod.qty
      @prod_detail[prod.prod_id] = [prod.prod_stock_id, prod.qty]
    end
  end

  def partial_page
    puts "params['page_number'].to_i", params['page_number'].to_i
    @products = Product.order(:id).limit(12).offset(12 * params['page_number'].to_i)
  end

  def add_product
    product_id=params["product_id"]
    stock_id=params["stock_id"]
    is_decrement = params["is_decrement"]
    puts "is_decrement"
    puts is_decrement

    qty = 0
    qty_to_increment = is_decrement.present? ? -1 : 1
    customer = Customer.where(:user_sign_in_id => session[:user_id]).first
    if customer.present?
      customer_order = CustomerOrder.where(:customer_id => customer.id, :status => 'in_basket').first
      if customer_order.present?
        customer_order_detail = CustomerOrderDetail.find_by_customer_order_id_and_product_stock_id(customer_order.id, stock_id)
        if customer_order_detail.present?
          customer_order_detail.update_attributes!(:quantity => customer_order_detail.quantity + qty_to_increment)
          qty = customer_order_detail.quantity
          if qty == 0
            customer_order_detail.delete
          end
        else
          CustomerOrderDetail.create!(:customer_order_id => customer_order.id, :product_stock_id => stock_id)
          qty = 1
        end
        respond_to do |format|
          format.json { render json: qty}
        end
        # render :nothing => true, :status => 204, :content_type => 'text/html'
      else
        ActiveRecord::Base.transaction do
          customer_order = CustomerOrder.create!(:customer_id => customer.id, :status => 'in_basket')
          CustomerOrderDetail.create!(:customer_order_id => customer_order.id, :product_stock_id => stock_id)
          qty = 1
          respond_to do |format|
            format.json { render json: qty}
          end
        end
      end
    else
     @error = 'Please Login to continue.'
     render :nothing => true, :status => 404
    end

  end

end