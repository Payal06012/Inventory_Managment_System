require_relative '../Controller/auth_controller'
require_relative '../Controller/product_controller'
require_relative '../Models/Electronics'
require_relative '../Models/Cloths'


PRODUCT_CONTROLLER = Product_controller.new.freeze
USER_CONTROLLER = User_controller.new.freeze

def separator
  puts "*"*40
end

# separator
# puts "Inventory_Management_System"
# separator


# puts "Choose option"
# puts "Enter 1 for Register"
# puts "Enter 2 for Login"

# input = gets.chomp.to_i

# case input                                                                               

# when 1 
    
#     puts "Enter your name "
#     user_name = gets.chomp

#     puts "Enter your email :"
#     email = gets.chomp

#     puts "choose your Role : \n Customer  \n Vendor"
#     puts "Enter Role :"
#     role = gets.chomp

#     auth = Auth_controller.new
#     auth.register(user_name , email , role)

# when 2
#     login = false

#     until login
#     puts "Enter your Name "
#     user_name = gets.chomp
    
#     puts "Enter your email"
#     email = gets.chomp

#     p "#{user_name}  #{email}"

#     auth = Auth_controller.new
#     is_login = auth.login(user_name , email)
#     login = is_login[0]
#     role = is_login[1]

#      unless login
#         puts "login Again"
#      end
#     end

# else 
#     puts "invalid option"
# end


role = "vendor"
user_name = "vendor"
email = "vendor@123"



case role 

when "customer"
    separator
    puts "CUstomer Menu"
    separator
    
    puts "\n Select Options by writing respective Number \n"
    puts "1. View All Products"
    puts "2. order Product"
    puts "3, View Order History"
 
    option = gets.chomp.to_i

when "vendor"
    separator
    puts "Vendor Menu"
    separator

    puts "\n Select Options by writing respective Number \n"
    puts "1 View all products"
    puts "2 Add new Product"
    puts "3 View Orders "
    option = gets.chomp.to_i

when "admin"
    separator
    puts "Admin Menu"
    separator
    
    puts "\n Select Options by writing respective Number \n"
    puts "1 View All vendors"
    puts "2 View all Products"
    option = gets.chomp.to_i

end

# # puts option 

if role == "customer"
    if option == 1
        products = PRODUCT.get_all_product
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
        puts "ORDER PRODUCT"
        separator
    
    elsif option == 3
        separator
        puts "ORDER HISTORY"
        separator
opti
    end
end

if role == "vendor"
    if option == 1
        separator
        puts "VIEW PRODUCT"
        separator
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
                
        #get vendor_id
         userData = USER_CONTROLLER.get_user(user_name , email)
        #  puts "user_name = #{user_name}     email = #{email}"
        if userData
         vendorId = userData[:id].strip
          puts vendorId 
        end


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



    elsif option ==3
        separator
        puts "VIEW ORDERS"
        separator
    end
end


# # if role == "admin"
# #     if option == 1
# #         separator
# #         puts "VIEW ALL VENDOR"
# #         separator
# #     elsif OPTION == 2
# #         separator
# #         puts "VIEW "
# #         separator
# #     elsif option ==3
# #         separator
# #         puts "VIEW ALL PRODUCTS"
# #         separator
# #     end
# # end


