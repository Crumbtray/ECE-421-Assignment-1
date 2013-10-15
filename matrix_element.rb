#!/usr/bin/env ruby
require 'test/unit/assertions.rb'
include Test::Unit::Assertions

class MatrixElement
  attr_reader :value, :row, :col
  def initialize(value, row, col)
    #PRE
    #PRE end
    @value = value
    @row = row
    @col = col
  end
  
  def ==(element)
    @value==element.value &&
    @col==element.col &&
    @row==element.row
  end
  
  def eql?(element)
    self == element
  end
  
  def hash
    @value.hash ^ @col.hash ^ @row.hash
  end
end