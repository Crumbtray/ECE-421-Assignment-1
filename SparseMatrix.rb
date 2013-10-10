#!/usr/bin/env ruby
require 'test/unit/assertions.rb'
require 'matrix'
include Test::Unit::Assertions

class SparseMatrix
    
    #Properties can be read, but not written to.
    attr_reader :values, :rows, :columns, :rowCount, :columnCount
    
    def initialize(matrix)

        #PRE
        begin
            raise ArgumentError, "SparseMatrix:: argument error -> .new() matrix argument must be a Matrix" unless matrix.kind_of?(Matrix)
        end
        #PRE end
        
        @values = Array.new
        @rows = Array.new
        @columns = Array.new
        @rowCount = matrix.row_size
        @columnCount = matrix.column_size

        
        matrix.each_with_index do |e, row, col|
            if(e != 0)
                @values.push(e)
                @rows.push(row)
                @columns.push(col)
            end
        end
        
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
            raise ArgumentError, "SparseMatrix:: argument error -> .AddNewValue() value argument must be an Integer" unless value.kind_of?(Integer)
        end
        
        begin
            raise ArgumentError, "SparseMatrix:: argument error -> .AddNewValue() col argument must be an Integer" unless col.kind_of?(Integer)
        end
        
        begin
            raise ArgumentError, "SparseMatrix:: argument error -> .AddNewValue() row argument must be an Integer" unless row.kind_of?(Integer)
        end
        
        begin
            raise ArgumentError, "SparseMatrix:: argument error -> AddNewValue() col argument must be within range" unless col < @columnCount
        end
        
        begin
            raise ArgumentError, "SparseMatrix:: argument error -> AddNewValue() row argument must be within range" unless row < @rowCount
        end
        
        begin
            raise ArgumentError, "SparseMatrix:: argument error -> AddNewValue() value argument must not be zero" unless value != 0
        end
        invariant
        #PRE end
        
        @values.push(value)
        @columns.push(col)
        @rows.push(row)
        
        #POST
        assert(@values.include?(value), "Value was not inserted.")
        assert(@rows.include?(row), "Row was not inserted.")
        assert(@columns.include?(col), "Column was not inserted." )
        invariant
        #POST end
    end
    
    def to_s 
        puts "Sparse Matrix Non-Zero Valuese:"
        for i in 0..@values.length - 1
            puts "#{@values[i]} at #{@rows[i]}, #{@columns[i]}"
        end
        #POST
        invariant
        #POST end
    end
    
    def equals(sm)
        #PRE
        begin
            raise ArgumentError, "SparseMatrix:: argument error -> .new() matrix argument must be a Matrix" unless sm.kind_of?(SparseMatrix)
        end
        invariant
        #PRE end
        
        if(@rowCount != sm.rowCount)
            puts "RowCount not the same."
            return false
        end
        
        if(@columnCount != sm.columnCount)
            puts "ColumnCount not the same."
            return false
        end
        
        if(!@values.eql? sm.values)
            puts "Values Array not the same."
            return false
        end
        
        if(!@rows.eql? sm.rows)
            puts "Row Array not the same."
            return false
        end
        
        if(!@columns.eql? sm.columns)
            puts "Columns Array not the same"
            return false
        end
        
        return true
    end

    def invariant
       @rows.each{|x| assert(x <= @rowCount, "Invalid row value.")}
       @columns.each{|x| assert(x <= @columnCount, "Invalid column value.")}
       assert(@rows.length >= 0, "Cannot have negative rows.")
       assert(@columns.length >= 0, "Cannot have negative columns.")
       assert(@values.length >= 0, "Cannot have less than 0 values.")   
    end
    
end
