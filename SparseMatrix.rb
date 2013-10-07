#!/usr/bin/env ruby
require 'test/unit/assertions.rb'
include Test::Unit::Assertions

class SparseMatrix

   def initialize(matrix)

      #PRE
      begin
        raise "SparseMatrix:: runtime error -> .new() matrix argument must be a Matrix" unless matrix.kind_of?(Matrix)
      end
      #PRE end

      #POST
      begin
        raise "SparseMatrix:: runtime error -> .new() values must be an array" unless @values.kind_of?(Array)
      end
	  
      begin
        raise "SparseMatrix:: runtime error -> .new() value_column must be an array" unless @value_column.kind_of?(Array)
      end
	  
	  begin
        raise "SparseMatrix:: runtime error -> ,new() value_row must be an array" unless @value_row.kind_of?(Array)
      end
	  
	  begin
        raise "SparseMatrix:: runtime error -> invalid size" unless @size.is_a?(Integer) and @size >= 0
      end
      #POST end

   end

end
