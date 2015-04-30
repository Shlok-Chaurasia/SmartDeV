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

end