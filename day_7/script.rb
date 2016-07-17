require_relative 'solution'
require 'byebug'

file = File.new 'input.txt'
bit_converter = BitConverter.new(file.contents)
bit_converter.convert
puts "Wire a: #{bit_converter.data['a']}"

# Part 2 Solution: Reset wire b to 46065
file = File.new 'input.txt'
# TODO: Override the signal b
# file.contents.unshift "46065 -> b"
# NOTE: value b will be reset by the data again

new_bit_converter = BitConverter.new(file.contents)
new_bit_converter.convert
puts "Wire a new signal: #{new_bit_converter.data['a']}"
