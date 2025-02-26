# file1.rb

# Example Ruby code

# Define a simple class
class Greeter
  def initialize(name)
    @name = name
  end

  def greet
    "Hello, #{@name}!"
  end
end

# Create an instance of the class
greeter = Greeter.new("Todd")

# Call the greet method
puts greeter.greet
