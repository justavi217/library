class BooksController < ApplicationController
 
 
    def home
        @books = Book.all
    end
    
    def new
        @books = Book.new
    end
    
    def create
    @book = Book.new
    @book.title = params[:title]
    @book.author = params[:author]
    @book.description = params[:description]
    @book.pages = params[:pages]
    @book.author_id = params[:author_id]
    @book.amazon_url = params[:amazon_url]
    @book.picture_url = params[:picture_url]
    @book.save
    
        if @book.save
          redirect_to '/books'
      else
          render action: 'new'
        end
    end
    
    def edit
        @book = Book.find params[:id]
    end

  def update
    @book = Book.find params[:id]
    @book.title = params[:title]
    @book.description = params[:description]
    @book.pages = params[:pages]
    @book.author_id = params[:author_id]
    @book.amazon_url = params[:amazon_url]
    @book.picture_url = params[:picture_url]
  
    if @book.save
            redirect_to '/books'
        else
            render action: 'edit'
    end
  end
  
  def show
    @book = Book.find params[:id]
  end
end

