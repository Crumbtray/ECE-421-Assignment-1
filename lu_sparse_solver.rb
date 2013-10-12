#!/usr/bin/env ruby
require 'test/unit/assertions.rb'
include Test::Unit::Assertions

class LUSparseSolver
	def initialize(sparseMatrix)
	  #PRE
	  #PRE end
	  
	  #POST
      #POST end
	end
	
	def self.solve()
	  #PRE
	  begin
        raise "LUSparseSolver:: runtime error -> b argument must have a size that is equal to the number of rows in A" unless (b.size == A.GetRowCount())
      end
      #PRE end
	  
	  #POST
	  begin
		raise "LUSparseSolver:: runtime error -> vector b must not be modified" unless (copyOfB.equals(B))
	  end
	  
	  begin
		raise "LUSparseSolver:: runtime error -> SparseMatrix A must not be modified" unless (copyOfA.equals(A))
	  end
	  
	  begin
		raise "LUSparseSolver:: runtime error -> solution vector x must be equal to the solution of SparseMatrix A" unless (A*x == b)
	  end
      #POST end
	end
end