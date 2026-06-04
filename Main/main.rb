require_relative '../Controller/auth_controller'

puts "Inventory_Management_System"

# a1.login("auth" , "Admin1@gmail.com")

puts "Choose option"
puts "Enter 1 for Register"
puts "Enter 2 for Login"

input = gets.chomp.to_i

case input                                                                               

when 1 
    puts "Enter your ID "
    id = gets.chomp.to_i
    
    puts "Enter your name "
    name = gets.chomp

    puts "Enter your email :"
    email = gets.chomp

    puts "choose your Role : \n Customer  \n Vendor"
    puts "Enter Role :"
    role = gets.chomp

    auth = Auth_controller.new
    auth.register(id , name , email , role)

when 2
    login = false

    until login 

    puts "Enter your Name "
    name = gets.chomp
    
    puts "Enter your email"
    email = gets.chomp

    p "#{name}  #{email}"

    auth = Auth_controller.new
    login = auth.login(name , email)

     unless login 
        puts "login Again"
     end
    end

else 
    puts "invalid option"
end

    



