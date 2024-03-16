class SearchesController < ApplicationController

  def search
    @type = params[:type]
    @search = params[:search]
    if params[:type] == "book"
      if params[:method] == "1"
        @books = Book.where("title LIKE ?", "#{@search}")
      elsif params[:method] == "2"
        @books = Book.where("title LIKE ?", "#{@search}%")
      elsif params[:method] == "3"
        @books = Book.where("title LIKE ?", "%#{@search}")
      else
        @books = Book.where("title LIKE ?", "%#{@search}%")
      end
    else
      if params[:method] == "1"
        @users = User.where("name LIKE ?", "#{@search}")
      elsif params[:method] == "2"
        @users = User.where("name LIKE ?", "#{@search}%")
      elsif params[:method] == "3"
        @users = User.where("name LIKE ?", "%#{@search}")
      else
        @users = User.where("name LIKE ?", "%#{@search}%")
      end
    end
  end
  
end
