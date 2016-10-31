FactoryGirl.define do
  factory :language do
    name {Faker::GameOfThrones.house}
  end
end
