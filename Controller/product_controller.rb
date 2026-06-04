class Product_controller

    #===SAVE PRODUCT =======

    def self.save_product(data)
      p data 
      File.open("../Data/product.txt" , "a" ) do |file|
        p data

        file.puts data

       puts "Product Created Successfully"

      end

    end


    #==== GET ALL PRODUCT ==========

 def self.get_all_product 
      
   data =  File.read("../Data/product.txt").split("\n")
    # p data

   data.map do |p_data|  

    a ,b,c,d,e,f,g ,h = p_data.split("|")
    # puts b

    product_data = { id: a , name: b , category: c , sub_cateogry: d , atr: e , price: f , stock: g , vendor_id: h }
#   puts product_data

    end
end

  # ======= remove product =====

  def self.remove_product( sub_category , name , attr)

          
     get_all_product.each do |data|
      exist_sub_category = data[:sub_category]
      exist_p_name = data[:name]
      exist_attr = data[:atr]

  puts "#{exist_p_name}  #{exist_attr}"
       

  end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
end

#  data = Product_controller.get_all_product                                                        
# p data 

Product_controller.remove_product("a" , "b" , "c")

