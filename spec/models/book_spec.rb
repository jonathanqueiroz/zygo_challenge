require 'rails_helper'

RSpec.describe Book, type: :model do
  it 'is valid with all arguments' do
    book = FactoryBot.create(:book)
    expect(book).to be_valid
  end

  it 'is invalid with nil title' do
    book = FactoryBot.build(:book, title: nil)
    expect(book).to be_invalid
  end

  it 'is invalid with nil description' do
    book = FactoryBot.build(:book, description: nil)
    expect(book).to be_invalid
  end

  it 'is invalid with cover_url not being a valid url' do
    book = FactoryBot.build(:book, cover_url: 'teste123')
    expect(book).to be_invalid
  end

  it 'is invalid with nil author_name' do
    book = FactoryBot.build(:book, author_name: nil)
    expect(book).to be_invalid
  end
end
