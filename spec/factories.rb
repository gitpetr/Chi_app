include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@factory.com" }
    password  'qwertyqwerty'

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
    image { fixture_file_upload("#{Rails.root}/spec/fixtures/files/violin.jpg", "image/jpeg") }
    album
  end

  factory :contact do
    chirch_name 'Transfiguration'
    address 'Moscow'
    phone '111-222-333'
  end

  factory :album do
    name 'New album'
    description 'Some data'
    user
  end

  factory :welcome_message do
    content 'I am batman'
  end

  factory :sermon do
    title    'Dance of Fate'
    preacher 'Epica'
    record { fixture_file_upload("#{Rails.root}/spec/fixtures/files/record.mp3", "audio/mpeg") }
    recorded_date DateTime.now
    user
  end
end