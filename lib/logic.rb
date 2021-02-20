# module Player contains all the methods which are checking the move and sign validation
module Player
  @player1 = 'x'
  @player2 = 'o'
  def player_sign(sign)
    if sign == 'x'
      @player1
    else
      @player2
    end
  end

  def sign_validate(sign)
    if [@player1, @player2].include?(sign)
      true
    else
      false
    end
  end

  def move_validate(move)
    move = move.to_i
    if move < 10 && move.positive?
      true
    else
      false
    end
  end

  def index_taken(move, array)
    if array[move] == 'x' || array[move] == 'o'
      false
    else
      true
    end
  end

  def flip_user(var)
    if var == 'x'
      'o'
    else
      'x'
    end
  end

  def wins(array, sign)
    arr = []
    state = false
    win_array = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    if array.count(sign) > 2
      array.each_with_index do |value, index|
        arr.push(index) if value == sign
      end
    end
    arr = arr.sort
    win_array.each do |a|
      count = 0
      a.length.times do |i|
        count += 1 if arr.include? a[i]
      end
      if count == 3
        state = true
        break
      end
    end
    state
  end
end
