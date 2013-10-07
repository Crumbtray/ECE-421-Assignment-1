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
        #PRE end
        
        
        #POST
            assert(@values.include(value), "Value was not inserted.")
            assert(@rows.include(row), "Row was not inserted.")
            assert(@columns.include(col), "Column was not inserted." )
        #POST end
    end
    
    def GetRowCount
        #PRE
            # no change
        #PRE end
        
        #POST
            # no change
        #POST end
    end
    
    def to_s 
        #POST
            # no change
        #POST end
    end
    
    def equals(sm)
        #PRE
        begin
            raise "SparseMatrix:: runtime error -> .new() matrix argument must be a Matrix" unless sm.kind_of?(SparseMatrix)
        end
        #PRE end
        
        #POST
            # no change
        #POST end
    end

    # Invariants
    @rows.each{|x| assert(x <= rowCount)}
    @columns.each{|x| assert(x <= columnCount)}
    @rows.length > 0
    @coluumns.length > 0
    @values.length > 0    
    # Invariants end
    
end
