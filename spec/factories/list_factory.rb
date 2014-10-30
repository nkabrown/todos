FactoryGirl.define do
  
  factory :list do
    title "Homework"
  end

  factory :invalid_list, parent: :list do
    title nil
  end
end
