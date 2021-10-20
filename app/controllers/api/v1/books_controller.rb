class Api::V1::BooksController < ApplicationController
  before_action :auth
  before_action :set_book, only: %i[show update destroy]

  # GET /books
  def index
    render json: current_user.books.all if current_user
  end

  # GET /books/1
  def show
    render json: @book
  end

  # POST /books
  def create
    @book = Book.new(book_params)

    if @book.save
      render json: @book, status: :created
    else
      render json: @book.errors_full_messages, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    if @book.update(book_params)
      render json: @book
    else
      render json: @book.errors.full_messages, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy
    render json: { success: 'Book destroyed successfully' }, status: :ok
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def book_params
    params.require(:book)
      .permit(:title, :author, :category, :reading_percentage, :pagesTotal, :user_id)
  end
end
