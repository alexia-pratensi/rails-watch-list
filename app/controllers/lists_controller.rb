class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @movies = Movie.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(params_list)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end
  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end

  private

  def params_list
    params.require(:list).permit(:name, :photo)
  end

end
