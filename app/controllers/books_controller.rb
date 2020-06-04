class BooksController < ApplicationController

  def top
    
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    # バリデーションエラーの判断
    if @book.save
      redirect_to book_path(@book.id), notice: 'Book was successfully created.'
    else # 書き込み失敗
      @books = Book.all # 一覧表示用に全てのデータを取得
      render action: :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: 'Book was successfully updated.'
    else
      render action: :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
