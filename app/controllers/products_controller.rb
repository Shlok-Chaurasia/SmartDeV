class ProductsController < ApplicationController
  def product
    @all_product_count ||= Product.count
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
    prod_qty.each do |prod|
      puts prod.prod_id, prod.prod_stock_id, prod.qty
      @prod_detail[prod.prod_id] = [prod.prod_stock_id, prod.qty]
    end
  end

  def partial_page
    puts "params['page_number'].to_i", params['page_number'].to_i
    @products = Product.order(:id).limit(12).offset(12 * params['page_number'].to_i)
  end
  def add_quantity
    product_id=params["product_id"]
    stock_id=params["stock_id"]
    quantity=params["quantity"]
    if quantity.to_i < 0
      is_decrement = true
    end
    qty = 0
    qty_to_increment = quantity.to_i
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
          CustomerOrderDetail.create!(:customer_order_id => customer_order.id, :product_stock_id => stock_id, :quantity => qty_to_increment)
          qty = qty_to_increment
        end
        respond_to do |format|
          format.json { render json: qty}
        end
        # render :nothing => true, :status => 204, :content_type => 'text/html'
      else
        ActiveRecord::Base.transaction do
          customer_order = CustomerOrder.create!(:customer_id => customer.id, :status => 'in_basket')
          CustomerOrderDetail.create!(:customer_order_id => customer_order.id, :product_stock_id => stock_id, :quantity => qty_to_increment)
          qty = qty_to_increment
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

  def remove_from_basket
    customer = Customer.where(:user_sign_in_id => session[:user_id]).first
    customer_order = CustomerOrder.where(:customer_id => customer.id, :status => 'in_basket').first
    stock_id=params["stock_id"]
    customer_order_detail = CustomerOrderDetail.find_by_customer_order_id_and_product_stock_id(customer_order.id, stock_id)
    customer_order_detail.delete
    render :nothing => true, :status => 204, :content_type => 'text/html'
  end

  def add_product
    product_id=params["product_id"]
    stock_id=params["stock_id"]
    is_decrement = params["is_decrement"]
    qty = 0
    qty_to_increment = is_decrement.present? ? -1 : 1
    customer = Customer.where(:user_sign_in_id => session[:user_id]).first
    if customer.present?
      customer_order = CustomerOrder.where(:customer_id => customer.id, :status => 'in_basket').first
      if customer_order.present?
        customer_order_detail = CustomerOrderDetail.find_by_customer_order_id_and_product_stock_id(customer_order.id, stock_id)
        puts customer_order_detail.inspect
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

  def each_product
    @product_description = ProductDescription.find_by_product_id(params["id"])
    @product = Product.find_by_id(params["id"])
    @prod_qty = Customer.joins({:customer_order => {:customer_order_detail =>:product_stock }}).
        where(:user_sign_in_id => session[:user_id]).
        where("customer_orders.status in ('in_basket')").
        where("product_stocks.product_id =#{@product.id}").
        select("customer_order_details.quantity as qty, product_stocks.mrp as mrp,product_stocks.selling_price as sp, product_stocks.available_stock,product_stocks.available_stock_unit  ").first
    @product_stocks = ProductStock.where(:product_id => @product.id)
    puts @product.id
    puts @product_stocks
  end

end