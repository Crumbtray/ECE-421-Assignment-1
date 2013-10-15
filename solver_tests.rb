require 'test/unit'
require './sparse_matrix'
require './lu_sparse_solver'
require './tridiag_solver'

class SolverTests < Test::Unit::TestCase
  def test_lu_solver
    m = Matrix[[3, -0.1, -0.2], [0.1, 7, -0.3], [0.3, -0.2, 10]]
    sm = SparseMatrix.new(m)
    b = [7.85, -19.3, 71.4]
    luSolver = LUSparseSolver.new(sm)
    answer = luSolver.solve(b)
    assert_in_delta(3, answer[0], 0.00001)
    assert_in_delta(-2.5, answer[1], 0.00001)
    assert_in_delta(7, answer[2], 0.00001)
  end
  
  def test_lu_solver_wrong_b_size
    m = Matrix[[3, -0.1, -0.2], [0.1, 7, -0.3], [0.3, -0.2, 10]]
    sm = SparseMatrix.new(m)
    b = [7.85, -19.3]
    luSolver = LUSparseSolver.new(sm)
	assert_raise ArgumentError do
		answer = luSolver.solve(b)
    end   
    b = [7.85, -19.3, 71.4, 0]
	assert_raise ArgumentError do
		answer = luSolver.solve(b)
    end   
  end
  
  def test_tridiag_solver_skeleton
    m = Matrix[[1, 4, 0, 0],[3, 4, 1,0], [0, 2, 3, 4], [0, 0, 1, 3]]
    sm = SparseMatrix.new(m)
    b = [5, 3, 4, 1]
    triSolver = TriDiagSolver.new(sm)
    answer = triSolver.solve(b)
  end
  
  def test_tridiag_solver_wrong_b_size
    m = Matrix[[1, 4, 0, 0],[3, 4, 1,0], [0, 2, 3, 4], [0, 0, 1, 3]]
    sm = SparseMatrix.new(m)
    b = [5, 3, 4]
    triSolver = TriDiagSolver.new(sm)
	assert_raise ArgumentError do
		answer = triSolver.solve(b)
    end
    b = [5, 3, 4, 1, 0]
	assert_raise ArgumentError do
		answer = triSolver.solve(b)
    end
  end
end
