# frozen_string_literal: true
class Logic

  @@player1 = 'x'
  @@player2 = 'o'
  def player_sign(sign)
    if sign == 'x'
      @@player1
    else
      @@player2
    end
  end

  def sign_validate(sign)
    if [@@player1, @@player2].include?(sign)
      true
    else
      false
    end
  end

  def move_validate(move)
    move = move.to_i
    if move < 10 && move > 0
      true
    else
      false
    end
  end

  def index_taken(move, array)
    if array[move - 1] == 'x' || array[move - 1] == 'o'
      state = false
    else
      state = true
    end
    state
  end

  def flip_user(var)
    var = if var == 'x'
      'o'
    else
      'x'
    end
    var
  end
    
end

