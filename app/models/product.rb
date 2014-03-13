class Product < ActiveRecord::Base
    #attr_readable :title, :description, :price, :stock_quantity
      
    validates :title, :price, :stock_quantity, presence: true
    
end
