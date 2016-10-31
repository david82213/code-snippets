FactoryGirl.define do
  factory :code do
    sequence(:title) { |n| "#{Faker::Company.name} #{n}"}
    code  {Faker::Hipster.paragraph}
    # language {Language.find(1+rand(Language.count))}
    language
  end
end
