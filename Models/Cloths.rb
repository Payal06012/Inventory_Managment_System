require_relative "product"

class Cloths < Product 
     
    @count_stock = 0

    class << self 
  attr_accessor  :count_stock
    end

    def initialize(  p_name , p_price , p_stock , vendor_id , p_sub_category, attr1)
      
    @category = "Cloths"
    
     stock = self.class.count_stock

      @stock =  calculate_stock(stock , p_stock)

        # puts "CLASS CLOTHS"

        # puts "stock : #{p_stock}" 

        # @count_stock = @count_stock + p_stock
        # puts "Electronics stock = #{@count_stock}"

    super(  p_name , p_price , @category, @stock, vendor_id , p_sub_category, attr1)
     
    end

end


class Male_Cloths < Cloths

  @count_stock = 0

    class << self 
     attr_accessor :count_stock
    end

    def initialize(  p_name , p_price , p_stock , vendor_id , attr1)

    @sub_category = "Male_Cloths"
    
        stock = self.class.count_stock

      @stock =  calculate_stock(stock , p_stock)

        # puts "CLASS MALE CLOTHS"

     
#  @count_stock = @count_stock + p_stock 

    super(  p_name , p_price , @stock , vendor_id , @sub_category , attr1)
     
    end

end

class Female_Cloths  < Cloths

   @count_stock = 0

    class << self 
     attr_accessor :count_stock
    end

    def initialize(  p_name , p_price , p_stock , vendor_id , attr1)

    @sub_category = "Female_Cloths"
    
        stock = self.class.count_stock

      @stock =  calculate_stock(stock , p_stock)

        # puts "CLASS FEMALE_CLOTHS"

     
#  @count_stock = @count_kstock + p_stock 

    super(  p_name , p_price , @stock , vendor_id , @sub_category , attr1)
     
    end

end


# p1 = Male_Cloths.new( "pents" , 200 , 3 , 101 , "blue")
# p1 = Male_Cloths.new( "shirts" , 200 , 32 , 101 , "blue")
# p1 = Female_Cloths.new( "shirts" , 200 , 312, 101 , "blue")


