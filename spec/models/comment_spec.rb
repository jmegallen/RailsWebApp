require 'rails_helper'

describe Comment do

  context "Testing Validations missing rating" do
    
    it "is not valid without a rating" do
      expect(Comment.new(body: "Rad bike shame it's mint!!")).not_to be_valid
      @comment = FactoryBot.build(:comment, rating: nil)
      expect(@comment).not_to be_valid
    end
  end

  context "body empty" do
    it "is not valid" do
      expect(Comment.new(body: "")).not_to be_valid
    end
  end
  
end