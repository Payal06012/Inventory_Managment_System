class Product_controller

    #===SAVE PRODUCT =======

    def  save_product(data)
      p data 
       File.open("../Data/product.txt" , "a" ) do |file|
        p data

        file.puts data

       puts "Product Created Successfully"

      end

    end


    #==== GET ALL PRODUCT ==========

  def  get_all_product 
      
   data =  File.read("../Data/product.txt").split("\n")
    # p data

    data.map do |p_data|  

      a,b,c,d,e,f,g ,h = p_data.split("|")
     # puts b

     product_data = { id: a , name: b , category: c , sub_category: d , atr: e , price: f , stock: g , vendor_id: h }
        #  puts product_data

    end
  end

  # ======= remove product =====

  def  remove_product( sub_category , name , attrr)
      
    index = 0
    products = get_all_product
    products.length

    get_all_product.each do |data|
      exist_sub_category = data[:sub_category].strip.downcase
      exist_name = data[:name].strip.downcase
      exist_attr = data[:atr].strip.downcase

      if exist_sub_category == sub_category  && exist_attr == attrr  && exist_name == name
      #  puts "#{sub_category}  #{name}  #{attrr}"
        #  get_all_product.delete(data)
        puts index
          products.delete_at(index)

      else
       
      index += 1
      end
    end

    puts products

    #==== save updated data to file ====

     products.each do |data|
       puts data 
     end

       
  end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
end

p1 = Product_controller.new
p1.remove_product("charger" , "vivo" , "blue")

# File.open("../Data/test.txt" , "r") do |f|
#   p f 
#   File.delete(f)
# end
