# frozen_string_literal: true

require_relative '../lib/settings'
require_relative '../lib/logic'
require_relative 'main'

include Player # rubocop:disable Style/MixinUsage
include Settings # rubocop:disable Style/MixinUsage

describe 'Settings.draw_board' do
  it 'return the string in order to print the board' do
    expect(Settings.draw_board([1, 2, 3, 4, 5, 6, 7, 8,
                                9])).to eql("\n\n\n   |   |   \n 1 | 2 | 3 \n   |   |   \n---+---+---\n   |   |   \n 4 | 5 | 6 \n   |   |   \n --+---+-- \n   |   |   \n 7 | 8 | 9 \n   |   |   \n\n\n")
  end
end

describe 'Player.index_taken' do
  it 'returns true or false' do
    expect(Player.index_taken(1, [1, 'x', 3, 4, 5, 6, 7, 8, 9])).to eql(false)
    expect(Player.index_taken(1, [1, 2, 3, 4, 5, 6, 7, 8, 9])).to eql(true)
  end
end

# describe Player do
#   describe "#sign_validate" do
#     it "return true or false" do
#       sign_validate('x').to eql(true)
#     end
#   end
# end
