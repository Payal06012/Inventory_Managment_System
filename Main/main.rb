require_relative '../Controller/auth_controller'
require_relative '../Controller/product_controller'
require_relative '../Models/Electronics'
require_relative '../Models/Cloths'


 PRODUCT = Product_controller.new

 product = "afsgd"
 puts product


def separator 
    # puts "\n"
    puts "*"*40
    # puts "\n"
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
#     name = gets.chomp

#     puts "Enter your email :"
#     email = gets.chomp

#     puts "choose your Role : \n Customer  \n Vendor"
#     puts "Enter Role :"
#     role = gets.chomp

#     auth = Auth_controller.new
#     auth.register(name , email , role)

# when 2
#     login = false

#     until login
#     puts "Enter your Name "
#     name = gets.chomp
    
#     puts "Enter your email"
#     email = gets.chomp

#     p "#{name}  #{email}"

#     auth = Auth_controller.new
#     is_login = auth.login(name , email)
#     login = is_login[0]
#     role = is_login[1]

#      unless login
#         puts "login Again"
#      end
#     end

# else 
#     puts "invalid option"
# end


role = "customer"

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

# puts option 

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

    end
end

if role == "vendor"
    if option == 1
        separator
        puts "VIEW PRODUCT"
        separator
    elsif OPTION == 2
        separator
        puts "ADD NEW PRODUCT"
        separator

        puts "Enter category  \n 1 Electronics   \n 2 . Cloths
        Ctaegory = gets.chomp
     
        puts "Enter Product Name"
        name = gets.chomp

        puts "Enter Product Price"
        price = gets.chomp

        puts "Enter stock"
        stock = gets.chomp


   

    elsif option ==3
        separator
        puts "VIEW ORDERS"
        separator
    end
end


if role == "admin"
    if option == 1
        separator
        puts "VIEW ALL VENDOR"
        separator
    elsif OPTION == 2
        separator
        puts "VIEW "
        separator
    elsif option ==3
        separator
        puts "VIEW ALL PRODUCTS"
        separator
    end
end



