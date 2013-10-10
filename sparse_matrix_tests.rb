require 'simplecov'
SimpleCov.start
require 'test/unit'
require './sparse_matrix'
require './matrix_element'

class SparseMatrixTest < Test::Unit::TestCase
  def test_constructor
    m = Matrix[[0,0],[0,1]]
    sm = SparseMatrix.new(m)
    assert_equal(2, sm.columnCount)
    assert_equal(2, sm.rowCount)
    assert_equal(1, sm.elements.size)
    a = MatrixElement.new(1,1,1)
    assert_equal(a, sm.elements.first)
  end
    
  def test_constructor_fail
    m = Array.new
    assert_raise ArgumentError do
      sm = SparseMatrix.new(m)
    end   
  end
  
  def test_add_value
    m = Matrix[[0,1],[0,1]]
    sm = SparseMatrix.new(m)
    sm.AddNewValue(1,1,0)
  end
end