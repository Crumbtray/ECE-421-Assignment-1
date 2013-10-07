#!/usr/bin/env ruby
require 'test/unit/assertions.rb'
include Test::Unit::Assertions

class SparseMatrix

   def initialize(matrix)

      #PRE
      begin
        raise "Rray:: runtime error -> .new() values argument must be array" unless values.kind_of?(Matrix)
      end
      #PRE end

      #@values = values
      #@value_column = value_column
      #@value_row = value_row
      #@size = size

      #POST
      begin
        raise "Rray:: runtime error -> .new() inner_indices must be array" unless values.kind_of?(Array)
      end
	  
      begin
        raise "Rray:: runtime error -> .new() inner_indices must be array" unless value_column.kind_of?(Array)
      end
	  
	  begin
        raise "Rray:: runtime error -> .new() inner_indices must be array" unless value_row.kind_of?(Array)
      end
	  
	  begin
        raise "Rray:: runtime error -> .new() inner_indices must be array" unless size.is_a?(Integer)
      end
      #POST end

   end

end