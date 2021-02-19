class Settings
  def draw_board(array)
    @playing_array = array
    "\n\n\n   |   |   \n #{@playing_array[0]} | #{@playing_array[1]} | #{@playing_array[2]} \n   |   |   \n---+---+---\n   |   |   \n #{@playing_array[3]} | #{@playing_array[4]} | #{@playing_array[5]} \n   |   |   \n --+---+-- \n   |   |   \n #{@playing_array[6]} | #{@playing_array[7]} | #{@playing_array[8]} \n   |   |   \n\n\n"
  end
end
