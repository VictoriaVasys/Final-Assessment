FactoryGirl.define do
  factory :user do
    email "MyString"
    password "pass"
    password_confirmation "pass"
  end
  
  factory :user_with_links do
    after(:create) do |user|
      3.times do
        user.links << create(:link, user_id: user.id)
      end
    end
  end
  
  factory :link do
    sequence :url do |n|
      "https://www.#{n}.com"
    end
    sequence :title do |n|
      "Link #{n}"
    end
  end
end
