class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    @bookmark.save
    redirect_to list_path(@list)
  end

  def destroy
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
