class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]
  def index
    @boards = current_user.boards
  end

  def show
  end

  def new
    @board = current_user.boards.new
  end

  def create
    @board = current_user.boards.new(the_params)
    if @board.save
      redirect_to @board
    else 
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @board.destroy
    redirect_to boards_path
  end

  private 
  def the_params
    params.require(:board).permit(:name)
  end

  def set_board
    @board = current_user.boards.find(params[:id])
  end
end
