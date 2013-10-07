#!/usr/bin/env ruby
require 'test/unit/assertions.rb'
include Test::Unit::Assertions

class LUSparseSolver < AbstractSolver
	def initialize(sparseMatrix)
	  #PRE
      begin
        raise "LUSparseSolver:: runtime error -> SparseMatrix argument must be a SparseMatrix" unless sparseMatrix.is_a?(SparseMatrix)
      end
	  #PRE end
	  
	  #POST
      #POST end
	end
	
	def self.solve()
	  #PRE
      begin
        raise "LUSparseSolver:: runtime error -> b argument must be an Array" unless b.is_a?(Array)
      end
	  begin
        raise "LUSparseSolver:: runtime error -> b argument must have a size that is equal to the number of rows in A" unless (b.size == A.GetRowCount())
      end
      #PRE end
	  
	  #POST
	  begin
		raise "LUSparseSolver:: runtime error -> vector b must not be modified" unless (copyOfB == b)
	  end
	  
	  begin
		raise "LUSparseSolver:: runtime error -> SparseMatrix A must not be modified" unless (copyOfA == A)
	  end
	  
	  begin
		raise "LUSparseSolver:: runtime error -> solution vector x must be equal to the solution of SparseMatrix A" unless (A*x == b)
	  end
      #POST end
	end
end