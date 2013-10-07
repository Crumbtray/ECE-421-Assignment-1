#!/usr/bin/env ruby
require 'test/unit/assertions.rb'
include Test::Unit::Assertions

class LUSparseSolver < AbstractSolver
	def initialize(sparseMatrix)
	  #PRE
      begin
        raise "LUSparseSolver:: runtime error -> SparseMatrix argument must be an SparseMatrix" unless sparseMatrix.is_a?(SparseMatrix)
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
      #POST end
	end
end