require_relative "product"

class Electronics < Product
    
    @count_stock = 0

    class << self 
  attr_accessor  :count_stock
    end

    def initialize(p_id , p_name , p_price , p_stock , vendor_id , p_sub_category, attr1)
      
    @category = "Electronics"
    
     stock = self.class.count_stock

      @stock =  calculate_stock(stock , p_stock)

        # puts "CLASS ELECTRONICS"

        puts "stock : #{p_stock}" 

        # @count_stock = @count_stock + p_stock
        puts "Electronics stock = #{@count_stock}"

    super(p_id , p_name , p_price , @category, @stock, vendor_id , p_sub_category, attr1)
     
    end

end


class Phone < Electronics 
    
    @count_stock = 0 

    class << self 
     attr_accessor :count_stock
    end

    def initialize(p_id , p_name , p_price , p_stock , vendor_id , attr1)

    @sub_category = "Phone"
    
        stock = self.class.count_stock

      @stock =  calculate_stock(stock , p_stock)

        puts "CLASS PHONE"

     
#  @count_stock = @count_stock + p_stock 

    super(p_id , p_name , p_price , @stock , vendor_id , @sub_category , attr1)
     
    end
end



class Charger < Electronics

    @count_stock  = 0

    class << self 
      attr_accessor :count_stock
    end

    def initialize(p_id , p_name , p_price ,p_stock , vendor_id , attr1)
       
        @sub_category = "Charger"

        puts "CLASS CHARGER" 

        # === culculating stock 

        puts "class stock variable = #{self.class.count_stock}"

        stock = self.class.count_stock
        # @stock += p_stock 
        # self.class.count_stock = @stock 

      @stock =  calculate_stock(stock , p_stock)

        puts "stock = #{@stock}"


        super(p_id , p_name , p_price , @stock, vendor_id , @sub_category, attr1)
     
    end

   def self.stock 
     return @count_stock
   end

end

# (p_id , p_name , p_price , p_stock , vendor_id  attr1)

p1 = Charger.new(1 , "vivo" , 200 , 3 , 101 , "blue")
p1 = Charger.new(1 , "vivo" , 200 , 32 , 101 , "blue")
p1 = Charger.new(1 , "vivo" , 200 , 312, 101 , "blue")






