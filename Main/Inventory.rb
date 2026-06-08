require_relative '../Controller/auth_controller'
require_relative '../Controller/product_controller'
require_relative '../Models/Electronics'
require_relative '../Models/Cloths'
require_relative '../Controller/user_controller'
require_relative '../Models/Order'
require_relative '../Controller/order_controller'


PRODUCT_CONTROLLER = Product_controller.new.freeze
USER_CONTROLLER = User_controller.new.freeze
ORDER_CONTROLLER = OrderController.new.freeze

def separator
  puts "*"*40
end

separator
puts "Inventory_Management_System"
separator


puts "Choose option"
puts "Enter 1 for Register"
puts "Enter 2 for Login"

input = gets.chomp.to_i

case input                                                                               

when 1 
    
    puts "Enter your name "
    user_name = gets.chomp

    puts "Enter your email :"
    email = gets.chomp

    puts "choose your Role : \n Customer  \n Vendor"
    puts "Enter Role :"
    role = gets.chomp

    auth = Auth_controller.new
    auth.register(user_name , email , role)
   
    auth = Auth_controller.new
     is_login = auth.login(user_name , email)
    role = is_login[1]

when 2
    login = false

    until login
    puts "Enter your Name "
    user_name = gets.chomp
    
    puts "Enter your email"
    email = gets.chomp

    p "#{user_name}  #{email}"

    auth = Auth_controller.new
    is_login = auth.login(user_name , email)
    login = is_login[0]
    role = is_login[1]

     unless login
        puts "login Again"
     end
    end

else 
    puts "invalid option"
end


#============================================
# role = "customer"
# user_name = "test1"
# email = "test@123"
# vendorId = "C1"

#======== MENU =================
exit = false 
until exit do 
case role 

when "customer"
    separator
    puts "CUstomer Menu"
    separator
    
    puts "\n Select Options by writing respective Number \n"
    puts "1. View All Products"
    puts "2. Place Order"
    puts "3. View Order History"
    puts "4. Exit "
 
    option = gets.chomp.to_i

when "vendor"
    separator
    puts "Vendor Menu"
    separator

    puts "\n Select Options by writing respective Number \n"
    puts "1 View My products"
    puts "2 Add new Product"
    puts "3 Remove Product"
    puts "4 upadte product stock"
    puts "5 View Pending Order"
    puts "6 Accept or Reject Order"
    puts "7 View All Orders "
    puts "8 Exit"

    option = gets.chomp.to_i

when "admin"
    separator
    puts "Admin Menu"
    separator
    
    puts "\n Select Options by writing respective Number \n"
    puts "1 View All vendors"
    puts "2 View all Products"
    puts "3 Add Product"
    puts "4 Remove Product"
    puts "5 Update Product Stock"
    puts "6 view All Orders"

    option = gets.chomp.to_i

end

#=======CUSTOMER RESPONSIBILITIES =================

if role == "customer"
    
         #get csutomer_id
    userData = USER_CONTROLLER.get_user(user_name , email)
        #  puts "user_name = #{user_name}     email = #{email}"
        if userData
         customerId = userData[:id].strip
        end

    if option == 1
        products = PRODUCT_CONTROLLER.get_all_product
        # puts products

        separator
        puts "PRODUCTS"
        separator
        
           puts "Product Name   ||   Product_Category   ||   Price"
        products.each do |data|
           puts "#{data[:name].strip} ... #{data[:category].strip} ... #{data[:price].strip}"
        
        end

    elsif option == 2
        separator
        puts "PLACE ORDER"
        separator

        puts "Enter Product Name"
        product_name = gets.chomp
        puts "Enter Product Sub_Category"
        sub_category = gets.chomp       
        puts "Enter its feature"
        feature = gets.chomp
        puts "Enter quantity"

        current_stock = PRODUCT_CONTROLLER.current_stock(sub_category,product_name,feature)
        puts "Current stock = #{current_stock}"
        quantity = gets.chomp.to_i
        if quantity > current_stock
            puts "Sorry current stock is less"
            return
        end

        puts "Enter comment if any"
        comment = gets.chomp
        status = "Pending"

        product_data = PRODUCT_CONTROLLER.get_product(sub_category, product_name, feature)
        vendor_id = product_data[:vendor_id].strip
        total_price = product_data[:price].to_i * quantity
        product_id = product_data[:id].strip
        
     Order.new( product_id, customerId, vendor_id, quantity, total_price, status, comment)
        #update stock
      PRODUCT_CONTROLLER.update_stock(product_id, quantity , "reduce")

    
    elsif option == 3
        separator
        puts "ORDER HISTORY"
        separator

        get_all_order = ORDER_CONTROLLER.get_all_order
        # puts get_all_order
        get_all_order.each do |data|
            if data[:customer_id].strip == customerId
                puts "order id = #{data[:order_id].strip}...  product id = #{data[:product_id].strip} ... quantity = #{data[:quantity].strip} ... total price = #{data[:total_price].strip} ... status = #{data[:status].strip} ... comment = #{data[:comment].strip} ... order date = #{data[:order_date].strip}"
            end
        end
    elsif option == 4
        exit = true
    end
end

#======= VENDOR RESPONSIBILITIES =================

if role == "vendor"

     #get vendor_id
    userData = USER_CONTROLLER.get_user(user_name , email)
        #  puts "user_name = #{user_name}     email = #{email}"
        if userData
         vendorId = userData[:id].strip
          puts vendorId 
        end

    if option == 1
        separator
        puts "VIEW PRODUCT"
        separator

        products = PRODUCT_CONTROLLER.get_all_product
        s_no = 1
         puts "Product Name   ||   Product_Category   ||   stock"

        products.each do |data|    
           if data[:vendor_id].strip == vendorId
             puts "#{s_no}.  #{data[:name].strip} ... #{data[:category].strip} ... #{data[:stock].strip}"
             s_no += 1
            end
        end

    elsif option == 2
        separator
        puts "ADD NEW PRODUCT"
        separator

        puts "Enter number of category  \n 1 Electronics   \n 2. Cloths"
        category = gets.chomp.to_i
        
        if category == 1
         puts "Enter number of sub category  \n 1.Phones  \n 2. Charger"
        sub_category = gets.chomp.to_i
        elsif category == 2
        puts "Enter number of sub category  \n 1. MaleCloths  \n 2. FemaleCloths"
        sub_category = gets.chomp.to_i
        end
     
        puts "Enter Product Name"
        product_name = gets.chomp

        puts "Enter any feature like color"
        feature = gets.chomp

        puts "Enter Product Price"
        price = gets.chomp.to_i

        puts "Enter stock"
        stock = gets.chomp.to_i
                
        # create producct 
        if category == 1
            if  sub_category == 1
                 Phone.new( product_name , price , stock , vendorId  ,feature)                     
            elsif sub_category == 2
                 Charger.new( product_name , price , stock , vendorId ,feature)
            else
                puts "Invalid category or sub_category"
            end
        elsif category == 2
            if  sub_category == 1
                 Male_Cloths.new( product_name , price , stock , vendorId ,feature)                     
            elsif sub_category == 2
                 Female_Cloths.new( product_name , price , stock , vendorId ,feature)   
            else 
                puts "Invalid category or sub_category"

             end

        
        end    
    elsif option == 3
        separator
        puts "REMOVE PRODUCT"
        separator
        
        puts "Enter Product Name"
        product_name = gets.chomp

        puts "Enter Product Sub_Category"
        p_sub_category = gets.chomp

        puts "Enter its feature"
        feature = gets.chomp

        PRODUCT_CONTROLLER.remove_product( product_name, p_sub_category , feature)

    elsif option == 4
        separator
        puts "UPDATE PRODUCT STOCK"
        separator

        puts "choose a number \n 1 . Add stock  \n 2.Reduce Stock"
        update_option = gets.chomp.to_i
        puts "Enter number of sub category  \n 1.Phones  \n 2. Charger \n 3. MaleCloths  \n 4. FemaleCloths"
        sub_category_option = gets.chomp.to_i

        if sub_category_option == 1
            sub_category = "Phone" 
        elsif sub_category_option  == 2
            sub_category = "Charger" 
        elsif sub_category_option  == 3
            sub_category = "Male_Cloths"
        elsif sub_category_option  == 4         
            sub_category = "Female_Cloths"
        end           
     
        puts "Enter Product Name"
        product_name = gets.chomp

        puts "Enter any feature like color"
        feature = gets.chomp
        puts "product name = #{product_name}  sub_category = #{sub_category} feature = #{feature}"
        current_stock = PRODUCT_CONTROLLER.current_stock(sub_category,product_name,feature)
        puts "Current stock = #{current_stock}"
        
        puts "Enter stock"
        stock = gets.chomp.to_i

        product_data = PRODUCT_CONTROLLER.get_product(sub_category, product_name, feature)
        product_id = product_data[:id].strip

            if update_option == 1
                PRODUCT_CONTROLLER.update_stock(product_id , stock , "add")
            elsif update_option == 2
                PRODUCT_CONTROLLER.update_stock(product_id , stock , "reduce")
            end
                
    elsif option == 5
        separator
        puts "VIEW PENDING ORDERS"
        separator
            get_all_order = ORDER_CONTROLLER.get_all_order
        get_all_order.each do |data|
            if data[:vendor_id].strip == vendorId && data[:status].strip.downcase == "pending"
                puts "order id = #{data[:order_id].strip}...  product id = #{data[:product_id].strip} ... quantity = #{data[:quantity].strip} ... total price = #{data[:total_price].strip} ... status = #{data[:status].strip} ... comment = #{data[:comment].strip} ... order date = #{data[:order_date].strip}"
            end
        end

    elsif option == 6
        separator
        puts "ACCEPT OR REJECT ORDERS"
        separator
 
        get_all_order = ORDER_CONTROLLER.get_all_order
        get_all_order.each do |data|
            if data[:vendor_id].strip == vendorId && data[:status].strip.downcase == "pending"
                puts "order id = #{data[:order_id].strip}...  product id = #{data[:product_id].strip} ... quantity = #{data[:quantity].strip} ... total price = #{data[:total_price].strip} ... status = #{data[:status].strip} ... comment = #{data[:comment].strip} ... order date = #{data[:order_date].strip} \n"
                puts "Enter A for accept and R for Rehect or N for next"
                input = gets.chomp
                if input == "A" || "a"
                    ORDER_CONTROLLER.update_status(data[:order_id] , "accept")
                elsif input == "R" || "r"
                    ORDER_CONTROLLER.update_status(data[:order_id] , "reject")
                end
            end
        end


    elsif option == 7
        separator
        puts "VIEW ORDERS"
        separator
        

    elsif option == 9
        exit = true
    end
end

#========= ADMIN RESPONSIBILITIES =================

if role == "admin"
    if option == 1
        separator
        puts "VIEW ALL VENDOR"
        separator

        users = USER_CONTROLLER.get_all_user
        products = PRODUCT_CONTROLLER.get_all_product
        s_no = 1       
        count_product = 0

        users.each do |data|
    
        if data[:role].strip.downcase == "vendor"
                products.each do |product|
            if product[:vendor_id].strip == data[:id].strip
                count_product += 1
             end
         end

                puts "#{data[:id]}.  name = #{data[:name].strip} ...email =  #{data[:email].strip} ... Total product = #{count_product}"
                s_no += 1
                count_product = 0
            end
        end


    elsif option == 2
        separator
        puts "VIEW ALL PRODUCTS"
        separator
    
        products = PRODUCT_CONTROLLER.get_all_product
        s_no = 1
         puts "Product Name   ||   Product_Category   ||   Price  || Stock  ||  Vendor Name"
        products.each do |data|
            vendor_name = ""
            users = USER_CONTROLLER.get_all_user
            users.each do |user|
                if user[:id].strip == data[:vendor_id].strip
                    # puts "vendor id = #{data[:vendor_id].strip}  user id = #{user[:id].strip}"
                    vendor_name = user[:name].strip
                    break
                end
            end 
        end

    elsif option ==3
        separator
        puts "ADD PRODUCT"
        separator

        puts "Enter Vendor Id"
        vendorId = gets.chomp

        puts "Enter number of category  \n 1 Electronics   \n 2. Cloths"
        category = gets.chomp.to_i
        
        if category == 1
         puts "Enter number of sub category  \n 1.Phones  \n 2. Charger"
        sub_category = gets.chomp.to_i
        elsif category == 2
        puts "Enter number of sub category  \n 1. MaleCloths  \n 2. FemaleCloths"
        sub_category = gets.chomp.to_i
        end
     
        puts "Enter Product Name"
        product_name = gets.chomp

        puts "Enter any feature like color"
        feature = gets.chomp

        puts "Enter Product Price"
        price = gets.chomp.to_i

        puts "Enter stock"
        stock = gets.chomp.to_i
                
        # create producct 
        if category == 1
            if  sub_category == 1

                 Phone.new( product_name , price , stock , vendorId  ,feature)
                     
            else
                 Charger.new( product_name , price , stock , vendorId ,feature)
            end
        elsif category == 2
            if  sub_category == 1
                 Male_Cloths.new( product_name , price , stock , vendorId ,feature)
                     
            else
                 Female_Cloths.new( product_name , price , stock , vendorId ,feature)               
            end
        
        end

    
    elsif option == 4
        separator
        puts "REMOVE PRODUCT"
        separator
        
        puts "Enter Product Name"
        product_name = gets.chomp

        puts "Enter Product Sub_Category"
        p_sub_category = gets.chomp

        puts "Enter its feature"
        feature = gets.chomp

        PRODUCT_CONTROLLER.remove_product( product_name, p_sub_category , feature)
    
    elsif option == 5
        separator
        puts "UPDATE PRODUCT STOCK"
        separator

        puts "choose a number \n 1 . Add stock  \n 2.Reduce Stock"
        update_option = gets.chomp.to_i
        puts "Enter number of sub category  \n 1.Phones  \n 2. Charger \n 3. MaleCloths  \n 4. FemaleCloths"
        sub_category_option = gets.chomp.to_i

        if sub_category_option == 1
            sub_category = "Phone" 
        elsif sub_category_option  == 2
            sub_category = "Charger" 
        elsif sub_category_option  == 3
            sub_category = "Male_Cloths"
        elsif sub_category_option  == 4         
            sub_category = "Female_Cloths"
        end           
     
        puts "Enter Product Name"
        product_name = gets.chomp

        puts "Enter any feature like color"
        feature = gets.chomp
        puts "product name = #{product_name}  sub_category = #{sub_category} feature = #{feature}"
        current_stock = PRODUCT_CONTROLLER.current_stock(sub_category,product_name,feature)
        puts "Current stock = #{current_stock}"
        
        puts "Enter stock"
        stock = gets.chomp.to_i

        product =  PRODUCT_CONTROLLER.et_product(sub_category , product_name , feature)
        product_id = product[:p_id]

            if update_option == 1
                PRODUCT_CONTROLLER.update_stock(product_id, stock , "add")
            elsif update_option == 2
                PRODUCT_CONTROLLER.update_stock(product_id, stock , "reduce")
            end
            

    elsif option == 6
        separator
        puts "VIEW ALL ORDERS"
        separator
    end
end

end

