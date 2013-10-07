require 'test/unit/assertions.rb'
include Test::Unit::Assertions

class AbstractSolverFactory

	def self.CreateSolver(matrix);
		raise NoMethodError, "call to abstract method 'CreateSolver'"
	end;
end