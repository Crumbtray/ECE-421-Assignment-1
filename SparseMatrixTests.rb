require 'simplecov'
SimpleCov.start
require 'test/unit'
require './SparseMatrix'

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
  
  def test_add_value
    m = Matrix[[0,1],[0,1]]
    sm = SparseMatrix.new(m)
    sm.AddNewValue(1,1,0)
    assert_equal(1, sm.values[2])
    assert_equal(1, sm.rows[2])
    assert_equal(0, sm.columns[2])
  end
end