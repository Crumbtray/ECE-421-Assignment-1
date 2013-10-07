#!/usr/bin/env ruby
require 'test/unit/assertions.rb'
require 'matrix'
include Test::Unit::Assertions

class SparseMatrix
        
    def initialize(matrix)

        #PRE
        begin
            raise "SparseMatrix:: runtime error -> .new() matrix argument must be a Matrix" unless matrix.kind_of?(Matrix)
        end
        
        invariant
        #PRE end

        #POST
        begin
            raise "SparseMatrix:: runtime error -> .new() values must be an array" unless @values.kind_of?(Array)
        end
	  
        begin
            raise "SparseMatrix:: runtime error -> .new() value_column must be an array" unless @rows.kind_of?(Array)
        end
	  
        begin
            raise "SparseMatrix:: runtime error -> ,new() value_row must be an array" unless @columns.kind_of?(Array)
        end
	  
        begin
            raise "SparseMatrix:: runtime error -> invalid size" unless @rowCount.is_a?(Integer) and @rowCount >= 0
        end
        
        begin
            raise "SparseMatrix:: runtime error -> invalid size" unless @columnCount.is_a?(Integer) and @columnCount >= 0
        end
        
        invariant
        #POST end

    end
    
    def AddNewValue(value, col, row)
        #PRE
        begin
            raise "SparseMatrix:: runtime error -> .AddNewValue() value argument must be an Integer" unless value.kind_of?(Integer)
        end
        
        begin
            raise "SparseMatrix:: runtime error -> .AddNewValue() col argument must be an Integer" unless col.kind_of?(Integer)
        end
        
        begin
            raise "SparseMatrix:: runtime error -> .AddNewValue() row argument must be an Integer" unless row.kind_of?(Integer)
        end
        
        invariant
        #PRE end
        
        
        #POST
        assert(@values.include(value), "Value was not inserted.")
        assert(@rows.include(row), "Row was not inserted.")
        assert(@columns.include(col), "Column was not inserted." )
        invariant
        #POST end
    end
    
    def GetRowCount
        #PRE
        invariant
            # no change
        #PRE end
        
        #POST
        invariant
            # no change
        #POST end
    end
    
    def to_s 
        #POST
        invariant
        #POST end
    end
    
    def equals(sm)
        #PRE
        begin
            raise "SparseMatrix:: runtime error -> .new() matrix argument must be a Matrix" unless sm.kind_of?(SparseMatrix)
        end
        invariant
        #PRE end
        
        #POST
        invariant
        #POST end
    end

    def invariant
       @rows.each{|x| assert(x <= rowCount, "Invalid row value.")}
       @columns.each{|x| assert(x <= columnCount, "Invalid column value.")}
       assert(@rows.length >= 0, "Cannot have negative rows.")
       assert(@coluumns.length >= 0, "Cannot have negative columns.")
       assert(@values.length >= 0, "Cannot have less than 0 values.")   
    end
    
end
