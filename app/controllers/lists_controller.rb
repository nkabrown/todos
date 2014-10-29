class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      flash[:notice] = "List created successfully"
      redirect_to lists_path
    else
      flash[:aler] = "We encountered a problem. Please try again."
      render :new
    end
  end


  private

    def list_params
      params.require(:list).permit(:title)
    end
end
