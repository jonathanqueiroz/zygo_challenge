require 'rails_helper'

RSpec.describe "Books", type: :request do
  let(:book) { FactoryBot.create(:book) }
  let(:book_params) { FactoryBot.attributes_for(:book) }
  let(:user) { FactoryBot.create(:user) }

  before :each do
    sign_in user
  end

  describe "GET /index" do
    it 'Returns status 200' do
      get books_url
      expect(response).to have_http_status 200
    end
  end

  describe "GET /show" do
    it 'Returns status 200' do
      get book_url(book)
      expect(response).to have_http_status 200
    end
  end

  describe "GET /new" do
    it 'Returns status 200' do
      get new_book_url
      expect(response).to have_http_status 200
    end
  end

  describe "POST /create" do
    it 'Creates a new book' do
      expect do
        post books_url, params: { book: book_params }
      end.to change(Book, :count).by(1)
    end

    it 'Fails to create a new book' do
      expect do
        post books_url, params: { book: FactoryBot.attributes_for(:book, title: nil) }
      end.to change(Book, :count).by(0)
    end
  end

  describe 'PATCH /update' do
    it 'updates the given book id' do
      book = Book.create! book_params
      patch book_url(book), params: { book: FactoryBot.attributes_for(:book) }
      expect(response).to redirect_to(book_url(Book.last))
    end

    it 'fails to updates the given book id' do
      patch book_url(book), params: { book: FactoryBot.attributes_for(:book, title: nil) }
      expect(response).not_to be_redirect
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the given book id' do
      book = Book.create! book_params
      expect do
        delete book_url(book)
      end.to change(Book, :count).by(-1)
    end
  end
end
