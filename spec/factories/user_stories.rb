FactoryGirl.define do
  factory :user_story do
    association :author, factory: :user
    persona
    desire "do something"
    benefit "get something of it"
    feature
  end
end
