class BooksController < ApplicationController
  
  before_action :correct_user, only: [:edit, :update]
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
     if @book.save
       redirect_to book_path(@book.id)
     else
       @books = Book.all
       render :index
     end
    flash[:notice] = "Welcome! You have signed up successfully."
    flash[:notice] = "You have created book successfully."
  end
  
  def about
  end
  

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @bookn = Book.new
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
     flash[:notice] = "You have updated book successfully"
     redirect_to book_path(@book.id)
    else
     flash[:alret] = "error"
     @books=Book.all
     render :index
    end
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to '/books'
  end
  
  # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body, :image)
  end
  
  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
  end
  
  
  
end
