FactoryGirl.define do
  factory :code do
    association :language, factory: :language
    
    sequence(:title) {|n| "#{Faker::Company.bs} #{n}" }
    code             { Faker::Hipster.paragraph }
  end
end
