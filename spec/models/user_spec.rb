require 'rails_helper'

describe User do
  context "Testing Validations password not 6 digit min" do
    it "will not validate" do
      expect(User.new(email:"jmmig@gmail.com", password: "1234")).not_to be_valid
    end
  end
end

require "rails_helper"

describe User, type: :model do
  it "should not validate users without an email address" do
    @user = FactoryGirl.build(:user, email: "not_an_email")
    expect(@user).to_not be_valid
  end
end