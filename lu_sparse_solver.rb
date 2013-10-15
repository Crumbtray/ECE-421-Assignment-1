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
        raise "LUSparseSolver:: runtime error -> b argument must have a size that is equal to the number of rows in A" unless (b.size == @A.rowCount)
      end
      #PRE end
	  
		m = make_matrix
		l = Matrix::LUPDecomposition.new(m)
		l.solve(b)
	  #POST
	  begin
		raise "LUSparseSolver:: runtime error -> vector b must not be modified" unless (copyOfB == b)
	  end
	  
	  begin
		#raise "LUSparseSolver:: runtime error -> SparseMatrix A must not be modified" unless (@copyOfA == (@A))
	  end
	  
	  begin
		#raise "LUSparseSolver:: runtime error -> solution vector x must be equal to the solution of SparseMatrix A" unless (@A*x == b)
	  end
      #POST end
	  result
	end
	
	def make_matrix
		matrix = Matrix.zero(@A.rowCount).to_a
		@A.elements.each do |e|
			matrix[e.row][e.col] = e.value
		end
		matrix = Matrix[*matrix]
	end
	
end