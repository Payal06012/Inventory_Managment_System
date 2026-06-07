class Product_controller

    #===SAVE PRODUCT DATA IN FILE=======

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

  # ======= REMOVE PRODUCT =====

  def  remove_product( name , sub_category , attrr)
      
    index = 0
    products = get_all_product
    products.length
    is_exist = false

    get_all_product.each do |data|
      exist_sub_category = data[:sub_category].strip.downcase
      exist_name = data[:name].strip.downcase
      exist_attr = data[:atr].strip.downcase

      if exist_sub_category == sub_category.strip.downcase  && exist_attr == attrr.strip.downcase  && exist_name == name.strip.downcase  
      is_exist = true
        #  puts "#{sub_category}  #{name}  #{attrr}"
        #  get_all_product.delete(data)
        puts index
          products.delete_at(index)

      else
       
      index += 1
      end
    end

    # puts products

        #==== save updated data to file ====
  if is_exist  
    File.open("../Data/product.txt", "w") do |file|
      products.each do |data|
          file.puts data.values.map(&:to_s).map(&:strip).join(" | ")
      end
    end
    puts "Product removed Successfully"
  else
     puts "Product not found"
  end
       
  end
  
  #=======GET PRODUCT =========

  def get_product(sub_category , name , attrr)

      products = get_all_product
      is_exist = false

      get_all_product.each do |data|
      exist_sub_category = data[:sub_category].strip.downcase
      exist_name = data[:name].strip.downcase
      exist_attr = data[:atr].strip.downcase

      if exist_sub_category == sub_category.strip.downcase  && exist_attr == attrr.strip.downcase  && exist_name == name.strip.downcase
           is_exist = true          
           return data 
        end
      end

      unless is_exist
         return false
      end
  end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
end

p1 = Product_controller.new
p1.remove_product("Adapter" , "Charger","White")
# product = p1.get_product( "Adapter" , "Charger","White")
# p product 

