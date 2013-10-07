#!/usr/bin/env ruby
require 'test/unit/assertions.rb'
include Test::Unit::Assertions

class TriDiagSolver < AbstractSolver
	def self.solve(b)
	  #PRE
      begin
        raise "TriDiagSolver:: runtime error -> b argument must be an Array" unless b.is_a?(Array)
      end
	  begin
        raise "TriDiagSolver:: runtime error -> b argument must have a size that is equal to the number of rows in A" unless (b.size == A.GetRowCount())
      end
      #PRE end
	  
	  #POST
      #POST end
	end
end