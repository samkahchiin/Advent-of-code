require_relative 'solution'
require 'byebug'
# Script
puts 'Does Santa Claus has helper? (y/n)'
input = gets.chomp.downcase

case input
when 'y'
  robot = Santa.new
  has_robot = true
  valid = true
when 'n'
  robot = nil
  has_robot = false
  valid = true
else
  puts "Please only enter 'y' or 'n'!"
  valid = false
end

if valid
  santa = Santa.new

  file = File.new 'input.txt'

  elf = Elf.new file.content
  first_time = true

  elf.give_instructions @map, santa, robot, first_time

  santa_gps = GPS.new santa, robot
  @map = santa_gps.draw_map

  santa.go_back_home santa_gps.x_starting_point, santa_gps.y_starting_point
  robot.go_back_home santa_gps.x_starting_point, santa_gps.y_starting_point if robot

  elf.give_first_present @map, santa_gps.y_starting_point, santa_gps.x_starting_point
  elf.give_instructions @map, santa, robot
  puts elf.count_presents @map
end
