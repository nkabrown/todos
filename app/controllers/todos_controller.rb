class TodosController < ApplicationController

  def new
    @todo = Todo.new
  end

  def create 
    @list = List.find(params[:list_id])
    @todo = @list.todos.new(todo_params)
    if @todo.save
      flash[:notice] = "New todo successfully created."
      redirect_to list_path(:list_id)
    else
      flash[:alert] = "We encountered a problem. Please try again."
      render :new
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to list_path(:list_id)
  end

  private

    def todo_params
      params.require(:todo).permit(:body)
    end
end
