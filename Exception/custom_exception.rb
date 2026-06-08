class UserAlreadyExistError < StandardError
  def initialize(msg = "User already exists")
    super(msg)
  end
end

    