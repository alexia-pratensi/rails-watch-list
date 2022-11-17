class BookmarksController < ApplicationController

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(params_bookmark)
    @movie = Movie.find(params[:bookmark][:movie_id])
    @list = List.find(params[:list_id])
    @movie.list = @movie
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end


  def destroy
  end

  private

  def params_bookmark
    params.require(:bookmark).permit(:comment, :movie_id)
  end

end
