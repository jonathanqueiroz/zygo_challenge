# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book, only: %i[show edit update destroy]
  before_action :set_order, only: %i[index search]

  def index
    @books = Book.order(title: @order_by)
  end

  def show; end

  def new
    @book = Book.new
  end

  def edit; end

  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to book_url(@book), notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to book_url(@book), notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    @books = Book.where('title LIKE :q OR description LIKE :q OR author_name LIKE :q',
                        q: "%#{params[:q]}%").order(title: @order_by)

    respond_to do |format|
      format.js
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def set_order
    @order_by = params[:order_by].blank? ? 'asc' : params[:order_by]
  end

  def book_params
    params.require(:book).permit(:title, :description, :cover_url, :author_name)
  end
end
