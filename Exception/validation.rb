class Validation

  def self.validate_name(name)
    raise EmptyFieldError, "Name cannot be empty" if name.strip.empty?
  end

  def self.validate_email(email)
    raise EmptyFieldError, "Email cannot be empty" if email.strip.empty?

    raise InvalidEmailError,
          "Invalid email format" unless email.match?(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
  end

  def self.validate_role(role)
    raise InvalidRoleError,
          "Role must be customer or vendor" unless ["customer", "vendor"].include?(role.strip.downcase)
  end

end