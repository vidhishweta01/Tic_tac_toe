require_relative '../lib/settings'
require_relative '../lib/logic'
require_relative 'main'

include Player # rubocop:disable Style/MixinUsage
include Settings # rubocop:disable Style/MixinUsage
array = ['x', 'x', 'x', 3, 4, 'o', 'o', 7, 8]
array1 = [0, 1, 2, 'x', 'x', 'x', 'o', 7, 'o']
array2 = [0, 1, 2, 'o', 4, 'o', 'x', 'x', 'x']
array3 = ['x', 1, 2, 'x', 4, 'o', 'x', 7, 8]
array4 = ['o', 'x', 'x', 3, 'x', 5, 'o', 'x', 8]
array5 = ['o', 'o', 'x', 3, 4, 'x', 'o', 7, 'x']
array6 = ['x', 1, 'o', 3, 'x', 'o', 6, 7, 'x']
array7 = [1, 2, 'x', 4, 'x', 6, 'x', 8, 9]
array8 = ['o', 'o', 'o', 4, 5, 6, 7, 8, 9]
array9 = [1, 2, 3, 'o', 'o', 'o', 7, 8, 9]
array10 = [1, 2, 3, 4, 5, 6, 'o', 'o', 'o']
array11 = ['o', 2, 3, 'o', 5, 6, 'o', 8, 9]
array12 = [1, 'o', 3, 4, 'o', 6, 7, 'o', 9]
array13 = [1, 2, 'o', 4, 5, 'o', 7, 8, 'o']
array14 = ['o', 2, 3, 4, 'o', 6, 7, 8, 'o']
array15 = [1, 2, 'o', 4, 'o', 6, 'o', 8, 9]

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
                                9])).to eql("\n\n\n   |   |   \n 1 | 2 | 3 \n   |   |   \n---+---+---\n   |   |   \n 4 | 5 | 6 \n   |   |   \n --+---+-- \n   |   |   \n 7 | 8 | 9 \n   |   |   \n\n\n") # rubocop:disable Layout/LineLength
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

describe 'Player.wins' do
  it 'return true for win cases' do
    expect(Player.wins(array, 'x')).to eql(true)
    expect(Player.wins(array1, 'x')).to eql(true)
    expect(Player.wins(array2, 'x')).to eql(true)
    expect(Player.wins(array3, 'x')).to eql(true)
    expect(Player.wins(array4, 'x')).to eql(true)
    expect(Player.wins(array5, 'x')).to eql(true)
    expect(Player.wins(array6, 'x')).to eql(true)
    expect(Player.wins(array7, 'x')).to eql(true)
    expect(Player.wins(array8, 'o')).to eql(true)
    expect(Player.wins(array9, 'o')).to eql(true)
    expect(Player.wins(array10, 'o')).to eql(true)
    expect(Player.wins(array11, 'o')).to eql(true)
    expect(Player.wins(array12, 'o')).to eql(true)
    expect(Player.wins(array13, 'o')).to eql(true)
    expect(Player.wins(array14, 'o')).to eql(true)
    expect(Player.wins(array15, 'o')).to eql(true)
  end
end
