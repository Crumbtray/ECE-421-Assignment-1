# Main ruby file to execute the rest of our code.
# For more information on how to execute our code, please look at our test files.
# Group 4
# Group Members:
# Tyler Schneider
# Jason Morawski
# Chris Beckett
# Clinton Wong

require './sparse_matrix'
require './tridiag_solver'
require './lu_sparse_solver'

puts "Examples to solve Systems of Linear Equations:"

puts "LU Decomposition Example"
m = Matrix[[3, -0.1, -0.2], [0.1, 7, -0.3], [0.3, -0.2, 10]]
puts "Matrix is:", m
puts "\n"
sm = SparseMatrix.new(m)
b = [7.85, -19.3, 71.4]
luSolver = LUSparseSolver.new(sm)
answer = luSolver.solve(b)
puts "Answer is:", answer

puts "-------"
puts "Tridiagonal Example"
m = Matrix[[2.04, -1.0, 0.0, 0.0], [-1.0, 2.04, -1.0, 0], [0, -1.0, 2.04, -1.0], [0, 0, -1.0, 2.04]]
puts "Matrix is:", m
puts "\n"
sm = SparseMatrix.new(m)
b = [40.8, 0.8, 0.8, 200.8]
tridiagSolver = TriDiagSolver.new(sm)
answer = tridiagSolver.solve(b)
puts "Answer is:", answer