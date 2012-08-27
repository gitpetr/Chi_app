FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@factory.com" }
    password  'qwerty'

    # Child of :user factory, since it's in the `factory :user` block
    factory :admin do
      admin true
    end
  end
end