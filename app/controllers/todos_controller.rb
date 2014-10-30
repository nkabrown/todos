class TodosController < ApplicationController

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      flash[:notice] = "New todo successfully created."
      redirect_to list_path(:list_id)
    else
      flash[:alert] = "We encountered a problem. Please try again."
      render :new
    end
  end

  private

    def todo_params
      params.require(:todo).permit(:body, :list_id)
    end
end
