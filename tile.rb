# require_relative("board")

class Tile
  attr_reader :bombed, :flagged, :revealed

  def initialize(board, pos, bombed)
    @board = board
    @pos = pos
    @bombed = bombed
    @flagged = false
    @revealed = false
    @neighbor_directions = [[-1, -1], [-1, 0], [-1, 1], [0, 1], [1, 1], [1, 0], [1, -1], [0, -1]]
  end

  def reveal
    if @revealed == false
      @revealed = true
    else
      puts "Tile is already revealed."
    end
  end

  def neighbors
    neighbor_arr = []
    @neighbor_directions.each do |dir|
      new_pos = [@pos[0] + dir[0], @pos[1] + dir[1]]
      neighbor_tile = @board[new_pos]
      neighbor_arr << neighbor_tile unless neighbor_tile.nil?
    end
    neighbor_arr
  end

  def neighbor_bomb_count
    neighbor_arr = neighbors
    num_bombs = 0
    neighbor_arr.each { |neighbor| num_bombs += 1 if neighbor.bombed }
    num_bombs
  end
end