json.extract! book, :id, :title, :description, :cover_url, :author_name, :created_at, :updated_at
json.url book_url(book, format: :json)
