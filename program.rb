
my_name = "Jamie"
def greeting(name) # here we say def to define a method and put the name of our method
  p "hello" + " " + name # here’s the code inside our method
end # and here we end or close our method
greeting(my_name)


def greeting2
  puts "Please enter your name:"
  name = gets.chomp
  puts "Hello" + " " + name
end
greeting2