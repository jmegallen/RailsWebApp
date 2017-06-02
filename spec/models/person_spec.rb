# require 'rails_helper'

# describe Person do
#   context "first and last name present" do
#     let(:person) { Person.new(first_name: "John", last_name: "Smith") }

#     it "should return first and last" do
#       expect(person.full_name).to eq "John Smith"
#     end
#   end

#   context "first name missing" do
#     let(:person) { Person.new(last_name: "Smith") }

#     it "should return last name only" do
#       expect(person.full_name).to eq "Smith"
#     end
#   end

#   context "last name missing" do
#     let(:person) { Person.new(first_name: "John") }

#     it "should return first name only" do
#       expect(person.full_name).to eq "John"
#     end
#   end

#   context "no names present" do
#     let(:person) { Person.new() }

#     it "should return nothing" do
#       expect(person.full_name).to eq ""
#     end
#   end
# end


# context "first and last name present" do
#     let(:person) { Product.new(name: "Mint Polo", description: "Minty Bike Polo" price: "993", rimsize: "28 inch", colour: "Mint Green", image_url: "https://foffabikes.com/wp-content/uploads/2016/01/SSGrey01b.jpg") }
