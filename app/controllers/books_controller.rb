class BooksController < ApplicationController
  before_action :authenticate_user!
  def index
       @books = Book.all
       @book = Book.new
       @user = current_user
  end

  def show
      @book1 = Book.new
      @book = Book.find(params[:id])
      @user = User.find(@book.user_id)
      
  end

  def edit
      @book = Book.find(params[:id])
      if @book.user_id != current_user.id
        redirect_to books_path
      end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] = 'successfully'
    redirect_to book_path(@book)
  else
    render 'edit'
  end
  end

  def create
        # ストロングパラメーターを使用
         @book = Book.new(book_params)
         @book.user_id = current_user.id
        # DBへ保存する
        if @book.save
          flash[:alert] = 'successfully'
        # トップ画面へリダイレクト
        redirect_to book_path(@book.id)

      else
        @books = Book.all
        @user = current_user
        render 'index'

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
