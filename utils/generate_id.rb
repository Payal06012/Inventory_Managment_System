require_relative "../Controller/user_controller"
require_relative "../Controller/product_controller"
require_relative "../Controller/order_controller"

o = OrderController.new
p o.get_all_order

class Generate_id 

    attr_accessor :admins  , :customers  , :vendors

    def initialize
     user = User_controller.new

    all_user = user.get_all_user
    #   puts  @user.length
    # puts user
    
    @customers = 1
    @vendors = 1
    @admins = 1

    all_user.each do |data , chomp = true| 
       if data[:role].downcase.strip == "customer"
           @customers += 1
       elsif data[:role].downcase.strip == "vendor"
           @vendors += 1
       else
           @admins += 1 
       end   
       
        
    end

    end
    

    def get_user_id(role)
       if role.downcase.strip == "customer"
          return  "C" +  @customers.to_s         
       elsif role.downcase.strip == "vendor"
           return "V" + @vendors.to_s
       else
           return "A" + @admins.to_s
       end      


    end

    def get_product_id
       
        product_controller = Product_controller.new
        
         products = product_controller.get_all_product
         return products.length + 1
    
    end

    def get_order_id
         order_controller = OrderController.new
         orders = order_controller.get_all_order
          return orders.length + 1    
    end    
end

g1 = Generate_id.new
# #  p g1.get_id("admin")
#   p g1.get_product_id
  p g1.get_order_id

