FactoryGirl.define do
  factory :acceptance_criterion do
    description "Submit button is red"
    state "pending"
    user_story
  end
end
