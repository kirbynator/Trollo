class TasksController < ApplicationController
  before_action :set_board
  before_action :set_list
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
    
  end

  def show
  end

  def new
    @task = @list.tasks.new
  end

  def create
    @task = @list.tasks.new(the_params)
    if @task.save
    
      redirect_to user_board_path(current_user, @list.board_id)
    else 
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @task.destroy
    redirect_to user_board_path(current_user, @list.board_id)
  end

  private 
  def the_params
    params.require(:task).permit(:name, :top, :done)
  end
  
  def set_board
    
    @board = Board.find(params[:board_id])
  end

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
