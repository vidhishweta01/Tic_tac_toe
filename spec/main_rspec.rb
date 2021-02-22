require_relative '../lib/settings'
require_relative '../lib/logic'
require_relative 'main'

include Player # rubocop:disable Style/MixinUsage
include Settings # rubocop:disable Style/MixinUsage

describe '#Player.sign_validate' do
  it 'returns true' do
    expect(Player.sign_validate('x')).to eql(true)
    expect(Player.sign_validate('o')).to eql(true)
  end
end

describe '#players' do
  it 'prints player next move and returns sign' do
    expect(players('x')).to eql('x')
    expect(players('o')).to eql('o')
  end
end

describe '#Player.move_validate' do
  it 'validates the move' do
    expect(Player.move_validate('1')).to eql(true)
    expect(Player.move_validate('9')).to eql(true)
    expect(Player.move_validate('10')).to eql(false)
  end
end

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

describe 'Player.flip_user' do
  it 'return O if player is X or X if player is O' do
    expect(Player.flip_user('x')).to eql('o')
    expect(Player.flip_user('o')).to eql('x')
  end
end
