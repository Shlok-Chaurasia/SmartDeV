# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
FRUITS = 'fruits'
VEGETABLE = 'vegetable'
SELLER_ID = 1
IMAGE_BASE_URL = '/my_images/products/'


product = Product.create!(:name => 'Desi Apple',:category_type => FRUITS, :seller_id => SELLER_ID, :price=>220.00,
                :image_url => IMAGE_BASE_URL+'apple1.jpg')
ProductStock.create(:product_id => product.id, :available_stock_in_grams =>250, :is_available => true)
ProductStock.create(:product_id => product.id, :available_stock_in_grams =>500, :is_available => true)
ProductStock.create(:product_id => product.id, :available_stock_in_grams =>1000, :is_available => true)

product = Product.create!(:name => 'Kashmiri Apple',:category_type => FRUITS, :seller_id => SELLER_ID+1, :price=>220.00,
                :image_url => IMAGE_BASE_URL+'apple2.jpeg')
ProductStock.create(:product_id => product.id, :available_stock_in_grams =>250, :is_available => true)
ProductStock.create(:product_id => product.id, :available_stock_in_grams =>500, :is_available => true)
ProductStock.create(:product_id => product.id, :available_stock_in_grams =>1000, :is_available => true)

product = Product.create!(:name => 'Wheat Corn',:category_type => FRUITS, :seller_id => SELLER_ID+2, :price=>220.00,
                :image_url => IMAGE_BASE_URL+'corn.jpeg')
ProductStock.create(:product_id => product.id, :available_stock_in_grams =>250, :is_available => true)
ProductStock.create(:product_id => product.id, :available_stock_in_grams =>500, :is_available => true)

product = Product.create!(:name => 'Garlic',:category_type => VEGETABLE, :seller_id => SELLER_ID, :price => 220.00,
                :image_url => IMAGE_BASE_URL+'garlic.jpeg')
ProductStock.create(:product_id => product.id, :available_stock_in_grams =>100, :is_available => true)
ProductStock.create(:product_id => product.id, :available_stock_in_grams =>250, :is_available => true)

product = Product.create!(:name => 'Ginger',:category_type => VEGETABLE, :seller_id => SELLER_ID, :price => 220.00,
                :image_url => IMAGE_BASE_URL+'ginger.jpeg')
ProductStock.create(:product_id => product.id, :available_stock_in_grams =>100, :is_available => true)
ProductStock.create(:product_id => product.id, :available_stock_in_grams =>250, :is_available => true)

product = Product.create!(:name => 'Green Capsicum',:category_type => VEGETABLE, :seller_id => SELLER_ID, :price => 220.00,
                          :image_url => IMAGE_BASE_URL+'green_capsicum.jpg')
ProductStock.create(:product_id => product.id, :available_stock_in_grams =>250, :is_available => true)
ProductStock.create(:product_id => product.id, :available_stock_in_grams =>500, :is_available => true)

product = Product.create!(:name => 'Green Chilli',:category_type => VEGETABLE, :seller_id => SELLER_ID, :price => 220.00,
                          :image_url => IMAGE_BASE_URL+'green_chilli.jpeg')
ProductStock.create(:product_id => product.id, :available_stock_in_grams =>100, :is_available => true)
ProductStock.create(:product_id => product.id, :available_stock_in_grams =>250, :is_available => true)

product = Product.create!(:name => 'Onion',:category_type => VEGETABLE, :seller_id => SELLER_ID, :price => 220.00,
                          :image_url => IMAGE_BASE_URL+'onion.jpeg')
ProductStock.create(:product_id => product.id, :available_stock_in_grams =>500, :is_available => true)
ProductStock.create(:product_id => product.id, :available_stock_in_grams =>1000, :is_available => true)
ProductStock.create(:product_id => product.id, :available_stock_in_grams =>5000, :is_available => true)

product = Product.create!(:name => 'Old Potato',:category_type => VEGETABLE, :seller_id => SELLER_ID, :price => 220.00,
                          :image_url => IMAGE_BASE_URL+'potato1.jpeg')
ProductStock.create(:product_id => product.id, :available_stock_in_grams =>500, :is_available => true)
ProductStock.create(:product_id => product.id, :available_stock_in_grams =>1000, :is_available => true)
ProductStock.create(:product_id => product.id, :available_stock_in_grams =>5000, :is_available => true)

product = Product.create!(:name => 'New Potato',:category_type => VEGETABLE, :seller_id => SELLER_ID, :price => 220.00,
                          :image_url => IMAGE_BASE_URL+'potato2.jpeg')
ProductStock.create(:product_id => product.id, :available_stock_in_grams =>500, :is_available => true)
ProductStock.create(:product_id => product.id, :available_stock_in_grams =>1000, :is_available => true)
ProductStock.create(:product_id => product.id, :available_stock_in_grams =>5000, :is_available => true)

product = Product.create!(:name => 'Red Capsicum',:category_type => VEGETABLE, :seller_id => SELLER_ID, :price => 220.00,
                          :image_url => IMAGE_BASE_URL+'red_capsicum.jpeg')
ProductStock.create(:product_id => product.id, :available_stock_in_grams =>250, :is_available => true)
ProductStock.create(:product_id => product.id, :available_stock_in_grams =>500, :is_available => true)

product = Product.create!(:name => 'Red Chilli',:category_type => VEGETABLE, :seller_id => SELLER_ID, :price => 220.00,
                          :image_url => IMAGE_BASE_URL+'red_chilli.jpg')
ProductStock.create(:product_id => product.id, :available_stock_in_grams =>250, :is_available => true)
ProductStock.create(:product_id => product.id, :available_stock_in_grams =>500, :is_available => true)

product = Product.create!(:name => 'Yellow Capsicum',:category_type => VEGETABLE, :seller_id => SELLER_ID, :price => 220.00,
                          :image_url => IMAGE_BASE_URL+'yellow_capsicum.jpeg')
ProductStock.create(:product_id => product.id, :available_stock_in_grams =>100, :is_available => true)
ProductStock.create(:product_id => product.id, :available_stock_in_grams =>250, :is_available => true)

user_sign_in = UserSignIn.create(:user_name => 'shlokch', :password => 'waqodiwa', :email => 'shlokiit.name@gmail.com')
customer_addr = []
Customer.create(:user_sign_in_id => user_sign_in.id, :name => 'shlok', :phone => 99163234)
customer_addr <<  CustomerAddress.create(:user_id => user_sign_in.id, :name => 'Rakesh Chaurasia', :address => 'C2/112 A-1 Tusli Kuan Hankar Tola Varanasi',
:landmark => 'near gadwa ghat', :phone=> 9889287419,:zipcode => 221010 )
customer_addr <<  CustomerAddress.create(:user_id => user_sign_in.id, :name => 'Jyoti Chaurasia', :address => 'C2/112 A-1 Tusli Kuan Hankar Tola Varanasi',
:landmark => 'near gadwa ghat', :phone=> 9889287419,:zipcode => 221010 )
customer_addr << CustomerAddress.create(:user_id => user_sign_in.id, :name => 'Aishwarya Chaurasia', :address => 'C2/112 A-1 Tusli Kuan Hankar Tola Varanasi',
:landmark => 'near gadwa ghat', :phone=> 9889287419,:zipcode => 221010 )

curr_time = Time.now

15.times do
  zipcodes = customer_addr.collect(&:zipcode).uniq
  curr_time = curr_time + 0.2.days
  zipcodes.each do |zpcd|
    Slot.create(:zipcode => zpcd, :slot_date_time => curr_time, :is_active => 1)
  end
end



