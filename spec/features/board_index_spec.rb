require "rails_helper"

RSpec.describe "Board Page", type: :feature do
  before(:each) do 
    @board1 = Board.create(title: "Project Board")
    @board2 = Board.create(title: "Project Board2")
  end

  it "has all the boards listed" do
    visit root_path
    expect(page).to have_content("Project Board")
    expect(page).to have_content("Project Board2")
  end

  it "can create a new board" do
    visit root_path
    click_link_or_button("Create a New Board")
    fill_in("board[title]", with: "New Board")
    click_link_or_button("Create a New Board")
    expect(page).to have_content("New Board")
    expect(current_path).to eq(boards_path)
  end

  it "can view the boards" do
    visit root_path
    click_link_or_button("Project Board")
    expect(current_path).to eq(board_path(@board1))
  end
end