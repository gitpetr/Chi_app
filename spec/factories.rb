FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@factory.com" }
    password  'qwerty'

    # Child of :user factory, since it's in the `factory :user` block
    factory :admin do
      admin true
    end
  end

  factory :article do
    title 'Some title'
    content 'text is here'
    user
  end

  factory :photo do
    description 'Photo name'
    image { fixture_file_upload("files/violin.jpg", "image/jpeg") }
  end
end