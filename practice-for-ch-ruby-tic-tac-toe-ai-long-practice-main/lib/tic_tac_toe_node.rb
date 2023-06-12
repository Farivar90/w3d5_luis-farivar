require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_accessor :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    children_arr = self.children
    children_arr.any? {losing_node?(evaluator)}
    return false
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    children_arr = []
    mark = self.board.next_mark
    mark == :o ? mark = :x : mark = :o
    (0...self.board.rows.length).each do |i1|
      (0...self.board.rows.length).each do |i2|
        dupper = self.board.dup
        (0...dupper.rows.length).each do |i|
          (0...dupper.rows.length).each do |j|
            dupper.rows[i][j] = mark unless dupper.rows[i][j]
          end
        end
        children_arr << TicTacToeNode.new(dupper, mark, [i1, i2]) unless self.board.rows[i1][i2]
      end
    end
    children_arr
  end

end

