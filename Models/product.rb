require_relative "../Controller/product_controller"

class Product 
     
    attr_accessor :p_id , :p_name , :p_sub_category  , :p_stock , :p_category  , :p_price  , :attr1  , :vendor_id

    def initialize(p_id , p_name , p_price , p_category, p_stock , vendor_id , p_sub_category, attr1)

        @p_id = p_id
        @p_name = p_name
        @p_price = p_price
        @p_category = p_category
        @p_stock = p_stock
        @p_sub_category = p_sub_category
        @attr1 = attr1
        @vendor_id = vendor_id
        
        puts " Product stock  = #{p_stock}"

    puts show 

    data_to_save = to_String_data

    Product_controller.save_product(data_to_save)

    end

    def show 
    puts "#{p_id}   ,  #{p_name} , #{p_sub_category}   , #{p_price}   ,  #{p_category}  , #{p_stock} ,  #{attr1}   , #{vendor_id}"  
    end

    def to_String_data
     "#{p_id}  |  #{p_name} |  #{p_category}  |   #{p_sub_category}  |  #{attr1}   |   #{p_price}  |   #{p_stock}  |   #{vendor_id}"  
    end


    #calculate stcok method

    def calculate_stock(total , new_stock)
        total += new_stock
    end

end
