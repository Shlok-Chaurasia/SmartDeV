module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
    cookies[:user_id] = user
  end

  # Returns the current logged-in user (if any).
  def current_user
    @drop_down_products ||= Customer.joins({:customer_order => {:customer_order_detail => {:product_stock=>:product}}}).
        select("product_stocks.id as product_stock_id, product_stocks.*, products.*, customer_order_details.quantity").
        where(:user_sign_in_id => session[:user_id]).where("customer_orders.status in ('in_basket')")
    @current_user ||= UserSignIn.find_by_id(session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

end
