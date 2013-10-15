#!/usr/bin/env ruby
require 'test/unit/assertions.rb'
include Test::Unit::Assertions

class TriDiagSolver
  #Properties can be read, but not written to.
    attr_reader :a, :b, :c

	def initialize(sparseMatrix)
	  #PRE
	  #PRE end
	  
	  #Copy sparseMatrix to a local copy with specialized storage schema for the tridiag solver
	  @a = Array.new(sparseMatrix.columnCount - 1){|i| 0}
	  @b = Array.new(sparseMatrix.columnCount){|i| 0}
	  @c = Array.new(sparseMatrix.columnCount - 1){|i| 0}
	  @d = Array.new(sparseMatrix.rowCount){|i| 0}
	  
	  sparseMatrix.each_with_index do |x, i|
	    if (x.row == (x.col + 1))
	      @a[x.col] = x.value
	    elsif (x.row == (x.col - 1))
        @c[x.col - 1] = x.value
      elsif (x.row == x.col)
        @b[x.col] = x.value
      else
        # This is not a triangular matrix
      end
	  end
	  
	  #POST
    #POST end
	end
	
	def solve(vB)
	  #PRE
	  begin
        raise "TriDiagSolver:: runtime error -> vB argument must be an array" unless vB.kind_of?(Array)
    end
	  begin
        #raise "TriDiagSolver:: runtime error -> b argument must have a size that is equal to the number of rows in A" unless (b.size == ))
    end
    #PRE end
	  
	  @d = vB.dup
	  
	  @c[0] = @c[0]/@b[0]
	  @d[0] = @d[0]/@b[0]
	  
	  @d[0 ... @d.length-1].each_with_index do |v, i|
	    @d[i + 1] -= @d[i].to_r * @a[i] / @b[i]
	    @b[i + 1]-= @c[i].to_r * @a[i] / @b[i]
	  end
	  
	  @d[0 ... @d.length-1].reverse.each_with_index {|v, i| @d[i] -= @d[i + 1] * @c[i] / @b[i + 1]}
	  
	  #POST
	  begin
		#raise "TriDiagSolver:: runtime error -> vector b must not be modified" unless (copyOfB.equals(b))
	  end
	  
	  begin
		#raise "TriDiagSolver:: runtime error -> SparseMatrix A must not be modified" unless (copyOfA.equals(A))
	  end
	  
	  begin
		#raise "TriDiagSolver:: runtime error -> solution vector x must be equal to the solution of SparseMatrix A" unless (A*x == b)
	  end
    #POST end
      
    @d.enum_for(:each_with_index).collect { |v, i| @d[i].to_r / @b[i]}
  end
end