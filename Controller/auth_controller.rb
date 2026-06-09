require_relative './user_controller'
require_relative '../Models/user.rb'
require_relative "../Exception/validation"
require_relative "../Exception/custom_exception"

class Auth_controller
attr_reader :user_controller

    def initialize
          @user_controller = User_controller.new         
    end

    def register(name , email , role)
        begin

        Validation.validate_role(role)
        Validation.validate_email(email)
        Validation.validate_name(name)

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
                return true
            else
            Vendor.new( name , email)
            return true
            end
        end

        rescue StandardError => e
            puts e.message
            return false
        end

    end



    def login(name , email)
    
        begin 
        
        Validation.validate_email(email)
        Validation.validate_name(name)

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
            return login , nil
        end
        
        rescue StandardError => e
            puts e.message
            return false , nil
        end

    end

end


# a1 = Auth_controller.new
# a1.register("payal23" , "payal123@gmail.com" , "customer")

   