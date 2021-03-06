class BoardsController < ApplicationController
  include BoardsHelper
  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to boards_path
    else
      render :new
    end
  end

  def show
    @board = Board.find_by(id: params[:id])
  end

  private

  def board_params
    params.require(:board).permit(:title)
  end
end
