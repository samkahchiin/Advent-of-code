require_relative 'solution'
require 'byebug'

file = File.new 'input.txt'
RoadPlanner.new file.contents
