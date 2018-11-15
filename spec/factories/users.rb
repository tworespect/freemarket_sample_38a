FactoryBot.define do
  factory :user do
    password = Faker::Internet.password(6)
    name { "hoge" }
    email { "hoge@example.com" }
    password { password }
    password_confirmation { password }
  end
end
