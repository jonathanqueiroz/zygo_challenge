FactoryBot.define do
  factory :user, class: 'User' do
    email { Faker::Internet.email }
    password { '123456' }
    role { Faker::Number.binary(digits: 1) }
  end
end
