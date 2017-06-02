require 'rails_helper'

describe Product do

  context "when the product has comments" do

    before do
      @product = Product.create!(name: "Mint Polo", description: "Minty Bike Polo", price: "993", rimsize: "28 inch", colour: "Mint Green", image_url: "https://foffabikes.com/wp-content/uploads/2016/01/SSGrey01b.jpg")
      @user = User.create!(first_name: "Jimmy", last_name: "Walsh", email: "jimw@gmail.com", password: "123456")
      @product.comments.create!(rating: 1, user: @user, body: "Shady work on the frame, ditch it!")
      @product.comments.create!(rating: 2, user: @user, body: "Just looks to geeky to me?")
      @product.comments.create!(rating: 3, user: @user, body: "Not keen on the green?")
      @product.comments.create!(rating: 4, user: @user, body: "Love it!")
      @product.comments.create!(rating: 5, user: @user, body: "Green Bike polo awsomeness!")
    end

    it "returns the average rating of all comments" do
      expect(@product.average_rating).to eq (3)
    end

    it "Testing Validations missing product name" do
      expect(Product.new(description: "Nice bike")).not_to be_valid
    end

  end

end