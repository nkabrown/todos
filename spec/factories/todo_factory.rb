FactoryGirl.define do

  factory :todo do
    body "HTML page"
    list
  end

  factory :invalid_todo, parent: :list do
    body nil
  end

end
