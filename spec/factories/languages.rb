FactoryGirl.define do
  factory :language do
    name    { Faker::Name.first_name }
  end
end
