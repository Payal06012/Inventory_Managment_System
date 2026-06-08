require_relative "../Models/order"
require_relative "../Controller/product_controller"


# g1 = Generate_id.new
#   p g1.get_order_id

class OrderController



#=== SAVE ORDER DATA IN FILE =======
    def  save_order(data)
      p data 
       File.open("../Data/order.txt" , "a" ) do |file|
        p data

        file.puts data

       puts "Order Placed Successfully"

      end

    end

  #==== GET ALL ORDER ==========

    def  get_all_order 
      
     data =  File.read("../Data/order.txt").split("\n")
      # p data

        data.map do |data|  

           a,b,c,d,e,f,g ,h ,i = data.split("|")
          # puts b

            order_data = { order_id: a , product_id: b , customer_id: c , vendor_id: d , quantity: e , total_price: f , status: g , comment: h , order_date: i }
         #  puts order_data

        end
    end

    
end

order = OrderController.new
# p o1.get_all_order



