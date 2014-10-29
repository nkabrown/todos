class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
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

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      flash[:notice] = "Your list has been renamed."
      redirect_to lists_path
    else
      flash[:alert] = "We encountered a problem. Please try again."
      render :edit
    end
  end

  private

    def list_params
      params.require(:list).permit(:title)
    end
end
