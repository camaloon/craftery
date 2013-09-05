FactoryGirl.define do
  factory :feature do
    name 'test feature'
    project
    association :owner, factory: :user
    status 'draft'
  end
end
