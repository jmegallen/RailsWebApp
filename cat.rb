class Cat
end

kitty = Cat.new

puts "Let's inspect our new cat:"
puts kitty.inspect
puts "What class does our new cat belong to?"
puts kitty.class
puts "Is our new cat an object?"
puts kitty.is_a ? (Object)

class Cat
attr_reader: color, : breed
attr_accessor: name
def initialize(color, breed)@ color = color@ breed = breed@ hungry = true
end

def feed(food)
puts "Mmmm, " + food + "!"@
hungry = false
end

def hungry ?
  if@ hungry
puts "I'm hungry!"
else
  puts "I'm full!"
end@ hungry
end

def speak
puts "Meow!"
end

end

kitty = Cat.new("grey", "Persian")

puts "What color is our cat?"
puts kitty.color

puts "Let's give our new cat a name"
kitty.name = "Betsy"
puts kitty.name

puts "Is our cat hungry now?"
kitty.hungry ?

puts "Let's feed our cat"
kitty.feed("tuna")
puts "Is our cat hungry now?"
kitty.hungry ?

puts "Our cat can make noise"
kitty.speak