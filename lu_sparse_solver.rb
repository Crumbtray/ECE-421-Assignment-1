#!/usr/bin/env ruby
require 'test/unit/assertions.rb'
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
	  matrices = lu_decomposition
	  x = matrices[0].inverse * matrices[1].inverse
	  temp = x.to_a
	  result = Array.new(b.size, 0)
	  (0 ... x.row_size).each do |i|
		(0 ... x.row_size).each do |j|
			result[i] += x[i,j] * b[j]
		end
	  end
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
	
	def lu_decomposition
		p = get_pivot
		converted = Matrix.zero(@A.rowCount).to_a;
		@A.elements.each do |e|
			converted[e.row][e.col] = e.value;
		end
		tmp = p * Matrix[*converted]
		u = Matrix.zero(@A.rowCount).to_a
		l = Matrix.identity(@A.rowCount).to_a
		(0 ... @A.rowCount).each do |i|
			(0 ... @A.rowCount).each do |j|
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
		id = Matrix.identity(@A.rowCount).to_a
		(0 ... @A.rowCount).each do |i|
			found = false
			@A.elements.each do |e|
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
			(i ... @A.rowCount).each do |j|
				@A.elements.each do |e|
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