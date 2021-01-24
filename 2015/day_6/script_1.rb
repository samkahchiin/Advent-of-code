require_relative 'solution_1'

file = File.new 'input.txt'
christmas_tree = ChristmasTree.new 1000

light_controller = LightController.new file.contents, christmas_tree.grid
puts "There are #{light_controller.calculate} light bulbs which is on"
