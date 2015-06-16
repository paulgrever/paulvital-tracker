require 'rails_helper'

RSpec.describe Ticket, type: :model do
  
  it "must have a title" do
    ticket = Ticket.new(description: "description 1")
    expect(ticket).to_not be_valid
  end

  it "has a relationship with board" do
    board1 = Board.create(title: "Board 1")
    ticket = Ticket.create(title: "Task 1", description: "description 1", board_id: board1.id)
    expect(ticket.board_id).to eq(board1.id)
  end
end
