
class User_controller

    #===== GET ALL USER ===========
    
    def get_all_user

       arr = File.readlines("../Data/user.txt")
    #    p arr

        #  p arr[0]
      all_users = arr.map do |data|
         id , name , email , role =  data.split("|")
       

        #   p data.strip
         
        users = {id: id , name: name , email: email , role: role}
        

       end

      #   puts  all_users


    end

      #=== SAVE USER DATA=====

   def save_user(data)
     File.open("../Data/user.txt" , "a") do |file|
        #  puts to_string_data
        file.puts data
        puts "user created successfully"

     end
    
   
   end

   #==== get user by name and email =====

   def get_user(name , email)

      users = get_all_user
      is_exist = false

      users.each do |data , chomp = true|
        exist_name = data[:name].strip.downcase
        exist_email = data[:email].strip.downcase

        if name.strip.downcase == exist_name  && email.strip.downcase == exist_email
           is_exist = true
           return data 
        end
      end

      unless is_exist
         return false
      end

   end

end


# user1 = User_controller.new
# user = user1.get_user("admin" , "Admin@gmail.com")
# p user 
