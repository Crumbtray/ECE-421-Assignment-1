#!/usr/bin/env ruby
require 'test/unit/assertions.rb'
require 'matrix'
require './matrix_element'
require 'forwardable'
include Test::Unit::Assertions

class SparseMatrix
    include Enumerable
    extend Forwardable
    
    #Properties can be read, but not written to.
    attr_reader :elements, :rowCount, :columnCount
    
    def initialize(matrix)
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
            raise "SparseMatrix:: runtime error -> invalid size" unless @rowCount.is_a?(Integer) and @rowCount >= 0
        end
        
        begin
            raise "SparseMatrix:: runtime error -> invalid size" unless @columnCount.is_a?(Integer) and @columnCount >= 0
        end
        
        invariant
        #POST end

    end
    
    # Adds a new element to the sparse matrix.  Cannot overwrite an existing element.
    # 
    # @param value [Integer] The value of the new element.
    # @param row [Integer] The row of the new element.
    # @param col [Integer] The column of the new element.
    def AddNewValue(value, row, col)
        #PRE
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
         assert(x.row < @rowCount, "Invalid row for element #{x}")
         assert(x.col < @columnCount, "Invalid column for element #{x}")
         }
    end
    
    def_delegators :@elements, :each, :<<
end
