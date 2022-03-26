class Book < ApplicationRecord
  require 'uri'

  validates :title, presence: true
  validates :description, presence: true
  validates :cover_url, format: { with: URI.regexp }, if: :cover_url_presence?
  validates :author_name, presence: true

  def cover_url_presence?
    cover_url.present?
  end

end
