require 'test/unit'
require './sparse_matrix'
require './lu_sparse_solver'
require './tridiag_solver'

class SolverTests < Test::Unit::TestCase
  def test_lu_solver_skeleton
    m = Matrix[[1, 4, 0, 0],[3, 4, 1,0], [0, 2, 3, 4], [0, 0, 1, 3]]
    sm = SparseMatrix.new(m)
    b = [5, 3, 4, 1]
    luSolver = LUSparseSolver.new(sm)
    answer = luSolver.solve(b)
  end
  
  def test_tridiag_solver_skeleton
    m = Matrix[[1, 4, 0, 0],[3, 4, 1,0], [0, 2, 3, 4], [0, 0, 1, 3]]
    sm = SparseMatrix.new(m)
    b = [5, 3, 4, 1]
    triSolver = TriDiagSolver.new(sm)
    answer = triSolver.solve(b)
  end
end
