FactoryGirl.define do
  factory :feature do
    name 'test feature'
    project
    association :owner, factory: :user
  end
end
