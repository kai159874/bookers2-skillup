class CommentsController < ApplicationController
  
  def show
    @book = Book.find(params[:id])
    @comment = Comment.new
  end
  
  def create
    book = Book.find(params[:book_id])
    comment = current_user.comments.new(comment_params)
    comment.book_id = book.id
    comment.save
    redirect_to book_path(book)
  end
  
  def destroy
  end
  
  private
  
  def comment_paramas
    params.require(:comment).parmit(:comment)
  end
  
end
