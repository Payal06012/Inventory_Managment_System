class User 
   attr_accessor :id , :name , :email ,:role , :user_data
  
  @@array = []

  def initialize(id , name , email , role)
   @id = id
   @name = name 
   @email = email
   @role = role
   
   @user_data = { id: @id , name: @name , email: @email , role: @role}
  
  #  puts "user data : "
  #  puts @user_data

  if @@array.empty?
    @@array.push(@user_data)
  else

   puts check_if_exist

   unless check_if_exist            #VALIDATE USER EXISTENCE
 
  @@array.push(@user_data)
  # #  puts "array : #{@@array}"
  # #  p @@array[0][:email]
    
   end

  end



  end



  def to_plainData
 "id : #{id} ,  name : #{name} , email : #{email}  ,  role : #{role}"
  end
   



  #====CHECK ID USER IS ALREADY EXIST =========

  def check_if_exist

    @@array.each do |user|
    #  puts "#{@email}  : #{user[:email]}"

      if @email == user[:email] 
        puts "user Already exist"
        
        return true 
      else 
        return false
      end

    end
  end


  def save_data 
    File.open("../Data/user.txt" , "a") do |file|
    file.write(@@array)

    
    end
  end 

def self.getUser


  filedata = File.read("../Data/user.txt")
  #  puts filedata 

    arr = filedata.strip.split("\n")
    # puts arr

    # ===== CHECHING DUPLICATE DATA =====

    puts "All User :"

    arr.each do |data| 
       p "#{data} \n \n"
    end

end
end

class Admin < User

    def initialize(id , name , email)

    super(id , name , email, "Admin")

    # puts "#{id}  name = #{name}"
 end

    
end

# ======= Takig user Inputs ============

# puts "Enter a User Id "
# id = gets.chomp.to_i

# puts "Enter your user name ="
# name  = gets.chomp

#puts " enter your email"
# email = gets.chomp

# puts "#{id}  name = #{name}"

# user1 = Admin.new(id, name , enail)

#========= CREACTING USERS ================

user1 = Admin.new(1 , "Payal" , "payal@gmail.com")
# user1.save_user_data
# user1.check_duplicate

user2 = Admin.new(2 , "Payal" , "payal@gmail.com")
user3 = Admin.new(3 , "Payal" , "payal@gmail.com")
user4 = Admin.new(1 , "Payal" , "khushi@gmail.com") 

User.getUser