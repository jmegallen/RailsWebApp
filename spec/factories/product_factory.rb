FactoryBot.define do

  factory :product do
    name "Mint Polo"
    description "Minty Bike Polo"
    price "993"
    rimsize "28 inch"
    colour "Mint Green"
    image_url "https://foffabikes.com/wp-content/uploads/2016/01/SSGrey01b.jpg"
  end

  factory :comment do
    rating "5"
    body "Rad mint bike!"
  end

end