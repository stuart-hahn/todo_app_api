class TodosController < ApplicationController
  before_action :set_todo, only: [ :show, :update, :destroy ]

  # GET /todos
  def index
    if params[:start_date] && params[:end_date]
      @todos = Todo.where(date: params[:start_date]..params[:end_date])
    else
      @todos = Todo.all
    end
    render json: @todos
  end

  # POST /todos
  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      render json: @todo, status: :created
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /todos/:id
  def update
    if @todo.update(todo_params)
      render json: @todo
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /todos/:id
  def destroy
    @todo.destroy
    head :no_content
  end

  private

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:content, :date)
  end
end
