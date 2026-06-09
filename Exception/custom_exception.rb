class UserAlreadyExistError < StandardError
  def initialize(msg = "User already exists")
    super(msg)
  end
end

class InvalidEmailError < StandardError
  def initialize(msg = "Invalid email format")
    super(msg)
  end
end

class InvalidRoleError < StandardError
  def initialize(msg = "Invalid role")
    super(msg)
  end
end

class ProductNotFoundError < StandardError
  def initialize(msg = "Product not found")
    super(msg)
  end
end

class EmptyFieldError < StandardError
  def initialize(msg = "Field cannot be empty")
    super(msg)
  end
end

class InvalidPriceError < StandardError
  def initialize(msg = "Price must be greater than 0")
    super(msg)
  end
end

class InvalidStockError < StandardError
  def initialize(msg = "Stock cannot be negative")
    super(msg)
  end
end

class InvalidCredentialsError < StandardError
  def initialize(msg = "Invalid credentials")
    super(msg)
  end
end

class OutOfStockError < StandardError
  def initialize(msg = "Insufficient stock available")
    super(msg)
  end
end