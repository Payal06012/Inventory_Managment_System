require_relative "../Controller/product_controller"

class OrderController

     #=== SAVE ORDER DATA IN FILE =======
    def  save_order(data)
      # p data 
       File.open("../Data/order.txt" , "a" ) do |file|
        # p data

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
    
    #==== UPDATE STATUS   =======

    def update_status(order_id , action)
        orders = get_all_order

        order_to_update = orders.find do |data|
              data[:order_id].strip == order_id.strip           
        end

          unless order_to_update
            puts "order not found"
            return
          end

          quantity = order_to_update[:quantity].strip
          product_id = order_to_update[:product_id].strip       
        
          if action == "accept"
            order_to_update[:status] = "Accept"
            puts "Order Accepted"
          elsif action == "reject"
            order_to_update[:status] = "Reject"
            order_to_update[:comment] = "Thos order is rejected"
            product = Product_controller.new
            product.update_stock(product_id, quantity , "add")
            puts "order Rejected"
          else
            puts "Invalid Status"
          end

          File.open("../Data/order.txt", "w") do |file|
            orders.each do |data|
            file.puts data.values.map(&:to_s).map(&:strip).join(" | ")
            end

          end
        
          # p orders

    end


end

# order = OrderController.new
# # # p order.get_all_order
# order.update_status( "1" , "reject")



