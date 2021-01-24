require 'byebug'

class File
  attr_accessor :contents

  def initialize file_name
    @contents = File.read(file_name).split("\n")
  end
end
class LightController
  attr_accessor :grid

  def initialize contents, grid
    @grid = grid
    contents.each do |instruction|
      analyze instruction
      process
    end
  end

  def analyze instruction
    instruction = instruction.split(" ")
    @x_starting_point = instruction[-3].split(",")[0].to_i
    @y_starting_point = instruction[-3].split(",")[1].to_i
    @x_end_point = instruction[-1].split(",")[0].to_i
    @y_end_point = instruction[-1].split(",")[1].to_i
    @command = instruction[-4]
  end

  def process
    (0..@grid.count - 1).each do |y_index|
      (0..@grid.count - 1).each do |x_index|
        if x_index.between?(@x_starting_point, @x_end_point) && y_index.between?(@y_starting_point, @y_end_point)
          case @command
          when 'on'
            @grid[y_index][x_index] += 1
          when 'off'
            @grid[y_index][x_index] -= 1 if @grid[y_index][x_index] > 0
          when 'toggle'
            @grid[y_index][x_index] += 2
          end
        end
      end
    end
  end

  def calculate
    @grid.flatten.inject(:+)
  end
end

class ChristmasTree
  attr_accessor :grid

  def initialize num
    @grid = Array.new(num, 0) { Array.new(num, 0) }
  end
end
