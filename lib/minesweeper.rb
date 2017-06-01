class MineSweeper
  def moore_neighbor(input)
    draw_board(evaluate_moore_number(create_board(input)))
  end

  def draw_board(matrix)
    matrix.reduce(""){|result, line| result + "#{line.join(" ")}\n"}
  end

  def create_board(string)
    string.split("\n").reduce([]){|matrix, line| matrix.push(line.strip.split(" "))}
  end

  def evaluate_moore_number(matrix)
    matrix_d = (matrix.size-1)
    for i in (0..matrix_d) do
      for j in (0..matrix_d) do
        if matrix[i][j] == 'O'
          x_neighbors = 0
          x_neighbors += 1 if i > 0 && j > 0 && matrix[i-1][j-1] == 'X'
          x_neighbors += 1 if i > 0 && matrix[i-1][j] == 'X'
          x_neighbors += 1 if i > 0 && matrix[i-1][j+1] == 'X'
          x_neighbors += 1 if j > 0 && matrix[i][j-1] == 'X'
          x_neighbors += 1 if j < matrix_d && matrix[i][j+1] == 'X'
          x_neighbors += 1 if i < matrix_d && j > 0 && matrix[i+1][j-1] == 'X'
          x_neighbors += 1 if i < matrix_d && matrix[i+1][j] == 'X'
          x_neighbors += 1 if i < matrix_d && j < matrix_d && matrix[i+1][j+1] == 'X'

          matrix[i][j] = x_neighbors
        end
      end
    end
    matrix
  end
end