class DynamicProgramming

  MOVES = [
    [0, 1],
    [0, -1],
    [1, 0],
    [-1, 0]
  ].freeze

  def initialize
    @blair_cache = { 1 => 1, 2 => 2 }
    @frog_cache = { 1 => [[1]] }
    @super_cache = Hash.new { |hash, key| hash[key] = { 1 => [[1]] } }
    @maze_cache = {}
  end



  def blair_nums(n)
    return @blair_cache[n] if @blair_cache[n]

    @blair_cache[n] = blair_nums(n - 1) + blair_nums(n - 2) + (n - 1) * 2 - 1
  end

  def frog_hops_bottom_up(n)
    frog_cache_builder(n)[n]
  end

  def frog_cache_builder(n)
    cache = {
      1 => [[1]],
      2 => [[1, 1], [2]],
      3 => [[1, 1, 1], [1, 2], [2, 1], [3]]
    }

    (4..n).each do |step|
      cache[step] = []
      (1..3).each do |diff|
        cache[step] += cache[step - diff].map { |arr| arr += [diff]}
      end
    end

    cache
  end

  def frog_hops_top_down(n)
    frog_hops_top_down_helper(n)
    @frog_cache[n]
  end

  def frog_hops_top_down_helper(n)
    return @frog_cache[n] if @frog_cache[n]
    @frog_cache[n] = []
    (1..3).each do |diff|
      next if n - diff < 0
      if n - diff == 0
        @frog_cache[n] += [[diff]]
      else
        @frog_cache[n] += frog_hops_top_down_helper(n - diff).map { |arr| arr += [diff] }
      end
    end

    @frog_cache[n]
  end


  def super_frog_hops(n, k)
    return @super_cache[k][n] if @super_cache[k][n]
    @super_cache[k][n] = []
    1.upto([k,n].min) do |diff|
      next if n - diff < 0
      if n - diff == 0
        @super_cache[k][n] += [[diff]]
      else
        @super_cache[k][n] += super_frog_hops(n - diff, k).map { |arr| arr += [diff] }
      end
    end

    @super_cache[k][n]
  end

  def knapsack(weights, values, capacity)

  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)
    cache = [Array.new(weights.length, 0)]
    1.upto(capacity) do |cap|

    end

  end

  def maze_solver(maze, start_pos, end_pos)
    return [end_pos] if start_pos == end_pos
    moves = MOVES.map do |m|

      end
  end

  private

  def best_combo(weights, values, capacity)

  end

  def dimensions(maze)
    [maze[0].length, maze.length]
  end

  def possible_move?(move, maze)
    dimensions = dimensions(maze)
    return false if maze[move[0]][move[1]] == 'X'
    return false if move[0][move[1]]
  end

  def populate_maze_cache(maze)

  end

  def solve_maze(maze, start_pos, end_pos)

  end
end
