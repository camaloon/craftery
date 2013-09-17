FactoryGirl.define do
  factory :user do
    name 'test user'
    sequence(:username) {|n| "testusr#{n}" }
    email 'testusr@test.test'
    password '123'
    password_confirmation '123'
  end
end
