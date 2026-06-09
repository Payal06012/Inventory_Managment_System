require_relative "../Controller/user_controller"
require_relative "../utils/generate_id"

class User
   attr_accessor  :name , :email , :role

    def initialize(name , email , role)
    
        generate_id = Generate_id.new
        
       puts role
     @id = generate_id.get_user_id(role)        # get id from genarator function 
     @name = name
     @email = email
     @role = role

  #convert data to string to save in a file 
     data = to_string_data
     p data 

     user = User_controller.new   
     admin = user.get_user("Admin123" , "Admin@gmail.com")
     unless admin
       puts "ADMIN #{admin}"
       user.save_user(" A1 | Admin123 | Admin@gmail.com | Admin")
     end
     user.save_user(data)
    
    end
    
    def to_string_data 
     "#{@id} | #{@name} | #{@email} | #{@role}"
    end

end

class Admin < User 
   
    def initialize( name , email)
        super(name , email, "Admin")
    end
end

class Customer < User 
   
    def initialize( name , email)
        super(name , email, "Customer")
    end
end

class Vendor < User 
   
    def initialize(name , email)
        super( name , email, "Vendor")
    end
end

#  user1 = User.new("Payal" , "payal@gmail.com" , "Admin")
#  a1 = Admin.new("Admin" , "Admin@gmail.com")
#  c1 = Customer.new("customer" , "Customer@gmail.com")


#  v1 = Vendor.new("vendor" , "Verndor@gmail.com" )

