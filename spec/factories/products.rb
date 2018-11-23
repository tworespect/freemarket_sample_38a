FactoryBot.define do
  factory :product do
    price 30000
    freight 1
    state_of_goods 1
    description "aaa"
    name "bbb"
    status 0
    ship_method 1
    ship_from_location 1
    ship_day 1
    user
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
  end
end
