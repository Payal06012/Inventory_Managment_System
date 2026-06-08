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

    #======= UPADTE PRODUCT STOCK ========

    def current_stock(sub_category , name , attrr)

        product = get_product(sub_category , name , attrr)
        p product[:stock].to_i
    end

 
def update_stock(sub_category, name, attrr, stock , update_type)
 
  product = get_product(sub_category, name, attrr)

  unless product
    puts "Product not found."
    return
  end

  product_id = product[:id].strip

  products = get_all_product

  product_to_update = products.find do |data|
    data[:id].strip == product_id
  end

  if product_to_update
    current_stock = product_to_update[:stock].to_i

    puts "stock = #{stock}  current stock = #{current_stock}  update type = #{update_type}"

    if update_type == "reduce"
      if stock.to_i < current_stock 
        updated_stock = current_stock - stock.to_i
      else
        puts "current stock is less."     
        return
      end 
    elsif update_type == "add"
      updated_stock = current_stock + stock.to_i  
    end


    product_to_update[:stock] = updated_stock.to_s

    puts "Stock updated successfully."
    puts "Current stock of #{name} is #{updated_stock}."  

    File.open("../Data/product.txt", "w") do |file|
      products.each do |data|
        file.puts data.values.map(&:to_s).map(&:strip).join(" | ")
      end
    end

    else
      puts "Product not found ."
    end
end  
      
end


p1 = Product_controller.new
# p1.remove_product("Adapter" , "Charger","White")
# product = p1.get_product( "Adapter" , "Charger","White")
# p product 
p1.update_stock("Male_Cloths" , "pents","Blue" , 34, "add"  )
# puts p1.current_stock("Male_Cloths" , "PENTS","Blue" )
# p1.current_stock("Charger" , "ERRR","O" )


