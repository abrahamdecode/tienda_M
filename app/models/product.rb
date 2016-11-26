class Product < ActiveRecord::Base
  validates :name,presence:true
  validates :price, numericality: { only_integer: true ,:less_than_or_equal_to => 100}
end
