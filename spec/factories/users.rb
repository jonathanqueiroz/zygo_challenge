FactoryBot.define do
  factory :user, class: 'User' do
    email { Faker::Internet.email }
    password { '123456' }
    role { 0 }
  end
end
