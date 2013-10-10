#!/usr/bin/env ruby
require 'test/unit/assertions.rb'
require 'matrix'
require './matrix_element'
include Test::Unit::Assertions

class SparseMatrix
    
    #Properties can be read, but not written to.
    attr_reader :elements, :rowCount, :columnCount
    
    def initialize(matrix)
        #PRE
        begin
            raise ArgumentError, "SparseMatrix:: argument error -> .new() matrix argument must be a Matrix" unless matrix.kind_of?(Matrix)
        end
        #PRE end
        
        @elements = Array.new
        @rowCount = matrix.row_size
        @columnCount = matrix.column_size

        matrix.each_with_index do |e, row, col|
          if(e != 0)
            element = MatrixElement.new(e, row, col)
            @elements.push(element)
          end
        end
        
        #POST
        begin
            raise "SparseMatrix:: runtime error -> .new() values must be an array" unless @elements.kind_of?(Array)
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
    
    # Adds a new value to the 
    def AddNewValue(value, row, col)
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
        
        begin
          raise ArgumentError, "SparseMatrix:: argument error -> AddNewValue() must not overwrite existing elements" unless @elements.none? {|x| x.row == row && x.col == col}
        end
        invariant
        #PRE end
        
        element = MatrixElement.new(value, row, col)
        @elements.push(element) 
        @elements.sort! do |a,b|
          comp = (a.row <=> b.row)
          comp.zero? ? (a.col <=> b.col) : comp
        end
        
        #POST
        assert(@elements.include?(element), "Element was not inserted.")
        invariant
        #POST end
    end
    
    def ==(sm)
        #PRE
        begin
            raise ArgumentError, "SparseMatrix:: argument error -> .new() matrix argument must be a Matrix" unless sm.kind_of?(SparseMatrix)
        end
        invariant
        #PRE end
        
        @columnCount == sm.columnCount &&
        @rowCount == sm.rowCount &&
        @elements == sm.elements
    end

    def eql?(sm)
      self == sm
    end

    def hash
      @columnCount.hash ^ @rowCount.hash ^ @elements.hash
    end

    def invariant
       assert(@elements.length >= 0, "Cannot have negative elements.")
       @elements.each {|x|
         assert(x.row < rowCount, "Invalid row for element #{x}")
         }
    end
    
end
