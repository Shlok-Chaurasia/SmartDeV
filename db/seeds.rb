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

Product.create!(:name => 'apple1',:category_type => FRUITS, :seller_id => SELLER_ID, :price=>220.00,
                :image_url => IMAGE_BASE_URL+'apple.jpg')
Product.create!(:name => 'apple2',:category_type => FRUITS, :seller_id => SELLER_ID+1, :price=>220.00,
                :image_url => IMAGE_BASE_URL+'apple.jpg')
Product.create!(:name => 'apple3',:category_type => FRUITS, :seller_id => SELLER_ID+2, :price=>220.00,
                :image_url => IMAGE_BASE_URL+'apple.jpg')
Product.create!(:name => 'potato1',:category_type => VEGETABLE, :seller_id => SELLER_ID, :price => 220.00,
                :image_url => IMAGE_BASE_URL+'potato.jpg')
Product.create!(:name => 'potato2',:category_type => VEGETABLE, :seller_id => SELLER_ID, :price => 220.00,
                :image_url => IMAGE_BASE_URL+'potato.jpg')
