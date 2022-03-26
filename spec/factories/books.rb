FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    description { Faker::Lorem.sentence }
    cover_url { 'https://picsum.photos/150' }
    author_name { Faker::Book.author }
  end
end
