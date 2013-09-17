FactoryGirl.define do
  factory :user do
    name 'test user'
    sequence(:username) {|n| "testusr#{n}" }
    email 'testusr@test.test'
    password '123'
    password_confirmation { password }
  end
end
