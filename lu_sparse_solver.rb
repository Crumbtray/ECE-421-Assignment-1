#!/usr/bin/env ruby
require 'test/unit/assertions.rb'
require 'matrix/lup_decomposition.rb'
include Test::Unit::Assertions

class LUSparseSolver
	def initialize(sparseMatrix)
	  #PRE
	  #PRE end
	  @A = sparseMatrix;
	  @copyOfA = @A
	  #POST
      #POST end
	end
	  
	def solve(b)
	  copyOfB = b
	  #PRE
	  begin
        raise ArgumentError, "LUSparseSolver:: argument error -> b argument must have a size that is equal to the number of rows in A" unless (b.size == @A.rowCount)
      end
      #PRE end
	  
	  l = Matrix::LUPDecomposition.new(@A.to_matrix)
	  result = l.solve(b)
	  #POST
	  begin
		raise "LUSparseSolver:: runtime error -> vector b must not be modified" unless (copyOfB == b)
	  end
	  
	  begin
		raise "LUSparseSolver:: runtime error -> SparseMatrix A must not be modified" unless (@copyOfA == @A)
	  end
      #POST end
	  result.to_a
	end
	
end