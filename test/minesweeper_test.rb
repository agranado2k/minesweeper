require_relative '../lib/minesweeper'

require 'minitest/autorun'

class MineSweeperTest < Minitest::Test
  def setup
    @minesweeper = MineSweeper.new
  end

  def test_create_matrix
    input = <<~END
      X O O X X X O O
      O O O O X O X X
      X X O X X O O O
      O X O O O X X X
      O O X X X X O X
      X O X X X O X O
      O O O X O X O X
      X O X X O X O X
    END

    matrix = [
      ['X', 'O', 'O', 'X', 'X', 'X', 'O', 'O'],
      ['O', 'O', 'O', 'O', 'X', 'O', 'X', 'X'],
      ['X', 'X', 'O', 'X', 'X', 'O', 'O', 'O'],
      ['O', 'X', 'O', 'O', 'O', 'X', 'X', 'X'],
      ['O', 'O', 'X', 'X', 'X', 'X', 'O', 'X'],
      ['X', 'O', 'X', 'X', 'X', 'O', 'X', 'O'],
      ['O', 'O', 'O', 'X', 'O', 'X', 'O', 'X'],
      ['X', 'O', 'X', 'X', 'O', 'X', 'O', 'X']]

    assert_equal @minesweeper.create_board(input), matrix        
  end

  def test_evaluate_moore_neighbor_number_1
    matrix = [
      ['O', 'X', 'O'],
      ['O', 'O', 'O'],
      ['O', 'O', 'O']
    ]

    moore_number = [
      [1, 'X', 1],
      [1,  1,  1],
      [0,  0,  0]
    ]

    assert_equal @minesweeper.evaluate_moore_number(matrix), moore_number
  end

  def test_evaluate_moore_neighbor_number_2
    matrix = [
      ['O', 'O', 'O'],
      ['O', 'X', 'O'],
      ['O', 'O', 'O']
    ]

    moore_number = [
      [1,  1,  1],
      [1, 'X', 1],
      [1,  1,  1]
    ]

    assert_equal @minesweeper.evaluate_moore_number(matrix), moore_number
  end

  def test_draw_board
    moore_number = [
      [1,  1,  1],
      [1, 'X', 1],
      [1,  1,  1]
    ]

    output = <<~END
      1 1 1
      1 X 1
      1 1 1
    END

    assert_equal @minesweeper.draw_board(moore_number), output
  end

  def test_final
    input = <<~END
      X O O X X X O O
      O O O O X O X X
      X X O X X O O O
      O X O O O X X X
      O O X X X X O X
      X O X X X O X O
      O O O X O X O X
      X O X X O X O X
    END

    output = <<~END 
      X 1 1 X X X 3 2
      3 3 3 5 X 5 X X
      X X 3 X X 5 5 4
      3 X 5 5 6 X X X
      2 4 X X X X 6 X
      X 3 X X X 5 X 3
      2 4 5 X 6 X 5 X
      X 2 X X 4 X 4 X
    END

    assert_equal output, @minesweeper.moore_neighbor(input)
  end
end