require_relative './user_controller'
require_relative '../Models/user.rb'

class Auth_controller
     attr_reader :users

    def initialize
          user1 = User_controller.new
          @users = user1.get_all_user
     
    end

    def register(id , name , email , role)
    
           email = email.strip

           #=== CHECK IF USER EXIST ======

        #    user1 = User_controller.new
        #    users = user1.get_all_user

            # p @users
        is_exist = false
            
        @users.each do |user|
            exist_email =  user[:email].strip
   
        # puts " #{exist_email} === #{email}"
             
             if exist_email == email 
                puts "User already exist "
 
                 is_exist = true          
                break 

             end
            end

            # if user is not exist craete new user
         p is_exist 
        unless is_exist 
            if role.downcase == "customer"
                Customer.new(id, name , email)
            else
            Vendor.new(id, name , email)
            end
        end

    end



    def login(name , email)

        login = false ;

     @users.each do |data|
        exist_name = data[:name].strip
        exist_email = data[:email].strip

        if name == exist_name  && email == exist_email
            login = true
            puts "login successfully"
            
            return login
        end

        # p (name == exist_name  && email == exist_email)
     
     end

     unless login 
        puts "Invalid Credentials"
        return login 
     end
end

end

# user1 = User_controller.new
# user1.get_all_user

# c1 = Customer.new(1 , "customer" , "Customer@gmail.com")
#  v1 = Vendor.new(1 , "vendor" , "Verndor@gmail.com")


a1 = Auth_controller.new
a1.register(2, "auth" , "auth1@gmail.com" ,"Customer")
a1.register(2, "auth" , "Admin2@gmail.com" ,"Vendor")

#  a = a1.login("auh" , "auth@gmail.com")
# puts a 
