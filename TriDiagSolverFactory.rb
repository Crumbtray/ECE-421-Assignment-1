require 'test/unit/assertions.rb'
include Test::Unit::Assertions

class TriDiagSolverFactory < AbstractSolverFactory

	def self.CreateSolver(matrix)
	
		#PRE
		begin
			raise "TriDiagSolverFactory: argument is not a SparseMatrix" unless matrix.is_a?(SparseMatrix);
		end
		#PRE end
		
		#POST
		begin
			raise "TriDiagSolverFactory: solver creation failed" unless solver.is_a?(TriDiagSolver);
		end
		#POST end
	
	end

end