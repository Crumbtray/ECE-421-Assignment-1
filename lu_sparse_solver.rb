#!/usr/bin/env ruby
require 'test/unit/assertions.rb'
include Test::Unit::Assertions

class LUSparseSolver
	def initialize(sparseMatrix)
	  #PRE
	  #PRE end
	  @matrix = sparseMatrix;
	  #POST
      #POST end
	end
	
	def self.bar
		puts 'class method'
	end
  
	def baz
		puts 'instance method'
	end
  
	def solve(b)
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
	
	def lu_decomposition
		p = get_pivot
		tmp = p * self
		u = Matrix.zero(row_size).to_a
		l = Matrix.identity(row_size).to_a
		(0 ... row_size).each do |i|
			(0 ... row_size).each do |j|
				if j >= i
					# upper
					u[i][j] = tmp[i,j] - (0 .. i-1).inject(0.0) {|sum, k| sum + u[k][j] * l[i][k]}
				else
					# lower
					l[i][j] = (tmp[i,j] - (0 .. j-1).inject(0.0) {|sum, k| sum + u[k][j] * l[i][k]}) / u[j][j]
				end
			end
		end
    [ Matrix[*l], Matrix[*u], p ]
	end
	
	def get_pivot
		#raise ArgumentError, "must be square" unless square?
		id = Matrix.identity(@matrix.rowCount).to_a
		(0 ... @matrix.rowCount).each do |i|
			found = false
			@matrix.elements.each do |e|
				if ( (e.row == i) and (e.col == i))
					found = true
				end
				if found
					max = e.value
					break
				end
			end
			if !found
				max = 0
			end
			row = i
			(i ... @matrix.rowCount).each do |j|
				@matrix.elements.each do |e|
					if ( (e.row == j) and (e.col == i))
						if e.value > max
							max = e.value
							row = j
						end
					end
				end
			end
		id[i], id[row] = id[row], id[i]
		end
    Matrix[*id]
	end
end