class ListsController < ApplicationController
  before_action :set_board
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  def index
    @boards = current_user.boards
  end

  def show
  end

  def new
    @list = @board.lists.new
  end

  def create
    @list = @board.lists.new(the_params)
    if @list.save
      redirect_to @board
    else 
      render :new
    end
  end

  def edit
  end

  def update
    if @list.update(the_params)
      redirect_to @board
    else 
      render :edit
  end
end

  def destroy
    @list.destroy
    redirect_to boards_path
  end

  private 
  def the_params
    params.require(:list).permit(:name)
  end
  
  def set_board
    @board = Board.find(params[:board_id])
  end

  def set_list
    @list = List.find(params[:id])
  end
end
