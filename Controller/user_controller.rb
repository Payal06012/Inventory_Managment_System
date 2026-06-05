
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

 



end


# user1 = User_controller.new
#   arr = user1.get_all_user
#   p arr