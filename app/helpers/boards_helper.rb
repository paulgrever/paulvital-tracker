module BoardsHelper
  def backlog_tickets
    @board.tickets.where(status: "Backlog")
  end

  def sprint_tickets
    @board.tickets.where(status: "Current Sprint")
  end

  def progress_tickets
    @board.tickets.where(status: "In Progress")
  end

  def done_tickets
    @board.tickets.where(status: "Done")
  end
end
