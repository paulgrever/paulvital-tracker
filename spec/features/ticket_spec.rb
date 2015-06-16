require "rails_helper"

RSpec.describe "Ticket", type: :feature do
  before(:each) do 
    @board1 = Board.create(title: "Project Board")
    @board2 = Board.create(title: "Project Board2")
    @ticket = Ticket.create(title: "Task",
                            description: "Here is what you need to do",
                            board_id: @board1.id) 
  end

  it "can view the tickets for the board" do
    visit board_path(@board1)
    expect(page).to have_content("Task")
  end

end