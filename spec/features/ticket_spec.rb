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

  it "can create a ticket for the board" do
    visit board_path(@board1)
    fill_in("ticket[title]", with: "New Ticket")
    fill_in("ticket[description]", with: "New Task Description")
    click_link_or_button("Add Task")
    expect(page).to have_content("New Task Description")
  end

  it "can update a ticket's status" do
    visit board_path(@board1)
    within(".backlog") do 
      expect(page).to have_content("Task")
      click_link_or_button("Progress")
    end
    within(".current-sprint") do 
      expect(page).to have_content("Task")
    end
  end

  it "can regress a ticket's status" do
    ticket = Ticket.create(title: "TASK 2", description: "description2", status: "Done", board_id: @board1.id )
    visit board_path(@board1)
    within(".done") do 
      expect(page).to have_content("TASK 2")
      click_link_or_button("Backtrack")
    end
    within(".in-progress") do 
      expect(page).to have_content("TASK 2")
    end
  end
end