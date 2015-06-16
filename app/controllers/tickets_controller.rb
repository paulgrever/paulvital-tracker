class TicketsController < ApplicationController
  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      redirect_to board_path(@ticket.board_id)
    else
      render :new
    end
  end

  def update
    @ticket = Ticket.find(params[:ticket][:id])
    if @ticket.update(ticket_params)
      redirect_to board_path(@ticket.board_id)
    else
      render :back
    end
  end

  private 

  def ticket_params
    params.require(:ticket).permit(:title, :description, :status, :board_id)
  end
end
