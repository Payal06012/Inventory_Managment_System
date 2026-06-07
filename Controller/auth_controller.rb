require_relative './user_controller'
require_relative '../Models/user.rb'

class Auth_controller
attr_reader :user_controller

    def initialize
          @user_controller = User_controller.new
         
    end

    def register(name , email , role)
    
           email = email.strip
           name = name.strip

           #=== CHECK IF USER EXIST ======

        is_exist = false
            user_data = @user_controller.get_user(name , email)
            if user_data
                puts "User already exist "
                  is_exist = true       
            end
        

            # if user is not exist craete new user
        #  p is_exist 
        unless is_exist 
            if role.downcase == "customer"
                Customer.new(name , email)
            else
            Vendor.new( name , email)
            end
        end

    end



    def login(name , email)

        login = false ;
        
         data = @user_controller.get_user(name , email)
         puts data 

        if data
            login = true
            puts "login successfully"
            return login , data[:role].downcase.strip
        end

        unless login 
            puts "Invalid Credentials"
            return login 
        end
    end

end


# a1 = Auth_controller.new

   