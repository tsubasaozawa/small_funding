FactoryBot.define do
  factory :project do
    title {"hello!"}
    content {"sample text"}
    goal_amount {"2000"}
    limit {"2019-12-31"}
    user
  end
end