require_relative '../lib/settings'
require_relative '../lib/logic'

include Player # rubocop:disable Style/MixinUsage
include Settings # rubocop:disable Style/MixinUsage
def players(sign)
  state = true
  while state
    if Player.sign_validate(sign)
      puts "player #{sign} make the move"
      break
    else
      puts 'enter the correct value'
      sign = gets.chomp
    end
  end
  sign
end

def move_check(move, array, var)
  state = true
  while state
    if Player.move_validate(move) && Player.index_taken(move - 1, array)
      array[move - 1] = var
      break
    else
      puts 'enter the correct value'
      move = gets.chomp.to_i
    end
  end
end

def draw
  puts 'its a draw'
  puts "Game Ended ! \u{1F61C}"
end

def continue_game
  game_flow
end

def game_flow # rubocop:disable Metrics/MethodLength
  array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  puts 'choose the player (1 is x) or (2 is o)'
  sign = gets.chomp
  puts Settings.draw_board(array).to_s
  sign = players(sign)
  i = 0
  while i < 9
    puts "\n you can choose between 1 to 9 for move "
    move = gets.chomp.to_i
    move_check(move, array, sign)
    puts Settings.draw_board(array).to_s
    if Player.wins(array, sign)
      puts "player #{sign} wins \u{1F911}"
      break
    end
    if i == 8
      draw
      break
    end
    sign = Player.flip_user(sign)
    puts "player #{sign} make the move"
    i += 1
  end
  puts 'do you want to continue'
  ch = gets.chomp
  continue_game if ch == 'yes'
end
p move_check(1, [1, 2, 3, 4, 5, 6, 7, 8, 9], 'x')
