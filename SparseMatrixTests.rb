require 'test/unit'
load "SparseMatrix.rb"

class SparseMatrixTest < Test::Unit::TestCase
  def test_constructor
    m = Matrix[[0,0],[1,1]]
    sm = SparseMatrix.new(m)
    assert_equal(2, sm.columnCount)
    assert_equal(2, sm.rowCount)
    expectedValues = [1,1]
    assert_equal(expectedValues, sm.values)
  end
    
  def test_constructor_fail
    m = Array.new
    assert_raise ArgumentError do
      sm = SparseMatrix.new(m)
    end   
  end
end