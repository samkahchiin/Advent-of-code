require_relative 'solution_2'

file = File.new 'input.txt'
christmas_tree = ChristmasTree.new 1000

light_controller = LightController.new file.contents, christmas_tree.grid

puts "The total brightness of all lights combined after following Santa's instructions is #{light_controller.calculate}"
