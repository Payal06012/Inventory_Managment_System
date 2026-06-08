require_relative "../Controller/order_controller"
require_relative "../utils/generate_id"

class Order
    attr_accessor :order_id, :product_id, :customer_id, :vendor_id, :quantity, :total_price, :status, :comment, :order_date
    
    def initialize( product_id, customer_id, vendor_id, quantity, total_price, status, comment)

            generate_id = Generate_id.new
            order_id = generate_id.get_order_id

        @order_id = order_id
        @product_id = product_id
        @customer_id = customer_id
        @vendor_id = vendor_id
        @quantity = quantity
        @total_price = total_price
        @status = status
        @comment = comment
        @order_date = Time.now.strftime("%Y-%m-%d %H:%M:%S")

       order_controller = OrderController.new
        order_controller.save_order(self.to_string_data)


    end

    def to_string_data
        "#{@order_id}|#{@product_id}|#{@customer_id}|#{@vendor_id}|#{@quantity}|#{@total_price}|#{@status}|#{@comment}|#{@order_date}"
    end

end

#   order_id: "O101",
#   product_id: "P101",
#   customer_id: "C101",
#   vendor_id: "V101",
#   quantity: 2,
#   total_price: 400,
#   status: "Pending",
#   comment: "",
#   order_date: "2026-06-08 10:30:00"

# p Time.now.strftime("%Y-%m-%d %H:%M:%S")

