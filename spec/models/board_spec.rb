require 'rails_helper'

RSpec.describe Board, type: :model do
  it "has a title" do
    board = Board.create(title: "Board 1")
    expect(board.title).to eq("Board 1")
  end
end
