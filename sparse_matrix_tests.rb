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
    assert_raise NoMethodError do
      sm = SparseMatrix.new(m)
    end   
  end
  
  def test_add_value
    m = Matrix[[0,0],[0,1]]
    sm = SparseMatrix.new(m)
    sm.AddNewValue(1,1,0)
    assert_equal(2, sm.elements.size)
    a = MatrixElement.new(1,1,0)
    assert_equal(a, sm.elements.first)
    sm.AddNewValue(1,0,1)
    b = MatrixElement.new(1,0,1)
    assert(b.eql? sm.elements.first)
  end
  
  def test_add_value_fail
    m = Matrix[[0,0],[0,1]]
    sm = SparseMatrix.new(m)
    assert_raise ArgumentError do
      sm.AddNewValue(0, 0, 0)
    end
    
    assert_raise ArgumentError do
      sm.AddNewValue(1, 3, 1)
    end
    
    assert_raise ArgumentError do
      sm.AddNewValue(1, 1, 3)
    end
    
    assert_raise ArgumentError do
      sm.AddNewValue(1, 1, 1)
    end
  end
  
  def test_equality
    m = Matrix[[0,0],[0,1]]
    sm = SparseMatrix.new(m)
    sa = SparseMatrix.new(m)
    assert_raise NoMethodError do
      sm.eql? m
    end
    
    assert(sm.eql? sa)
  end
  
  def test_hash
    m = Matrix[[0,0],[0,1]]
    sm = SparseMatrix.new(m)
    expectedHash = sm.columnCount.hash ^ sm.rowCount.hash ^ sm.elements.hash
    assert_equal(expectedHash, sm.hash)
  end
end