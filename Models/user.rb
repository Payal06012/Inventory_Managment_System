require_relative "../Controller/user_controller"

class User
   attr_accessor :id , :name , :email , :role

    def initialize(id , name , email , role)
     @id = id
     @name = name
     @email = email
     @role = role


  #convert data to string to save in a file 
     data = to_string_data
     p data 

     user = User_controller.new   
     user.save_user(data)
    
    end
    
    def to_string_data 
     "#{@id} | #{@name} | #{@email} | #{@role}"
    end

end

class Admin < User 
   
    def initialize(id , name , email)
        super(id , name , email, "Admin")
    end
end

class Customer < User 
   
    def initialize(id , name , email)
        super(id , name , email, "Customer")
    end
end

class Vendor < User 
   
    def initialize(id , name , email)
        super(id , name , email, "Vendor")
    end
end

#  user1 = User.new(1 , "Payal" , "payal@gmail.com" , "Admin")
#  a1 = Admin.new(1 , "Admin" , "Admin@gmail.com")
#  c1 = Customer.new(1 , "customer" , "Customer@gmail.com")
#  v1 = Vendor.new(1 , "vendor" , "Verndor@gmail.com")

