require 'byebug'
# For pluralize method
require 'active_support/inflector'

class Santa
  attr_accessor :x_coord, :y_coord, :largest_x_coord, :largest_y_coord, :smallest_x_coord, :smallest_y_coord

  def initialize
    @x_coord          = 0
    @y_coord          = 0
    @largest_x_coord  = 0
    @largest_y_coord  = 0
    @smallest_x_coord = 0
    @smallest_y_coord = 0
  end

  def go_back_home x_starting_point, y_starting_point
    @x_coord = 0
    @y_coord = 0
    @x_starting_point = x_starting_point
    @y_starting_point = y_starting_point
  end

  def listen_to_radio direction, map, first_time=false
    case direction
    when '>'
      @x_coord += 1
    when '<'
      @x_coord -= 1
    when '^'
      @y_coord += 1
    when 'v'
      @y_coord -= 1
    end
    first_time ? determine_distance : give_present(map)
  end

  def determine_distance
    @largest_x_coord  = @x_coord if @x_coord > @largest_x_coord
    @largest_y_coord  = @y_coord if @y_coord > @largest_y_coord
    @smallest_x_coord = @x_coord if @x_coord < @smallest_x_coord
    @smallest_y_coord = @y_coord if @y_coord < @smallest_y_coord
  end

  def give_present map
    y_current_coord = @y_coord + @y_starting_point
    x_current_coord = @x_coord + @x_starting_point
    map[y_current_coord][x_current_coord] += 1
  end
end

class GPS
  attr_accessor :x_starting_point, :y_starting_point
  def initialize santa, robot=nil
    @santa = santa
    @robot = robot
    analyze_data
    decide_starting_point
  end

  def analyze_data
    if !@robot.nil?
      @smallest_x_coord = [@santa.smallest_x_coord, @robot.smallest_x_coord].min
      @smallest_y_coord = [@santa.smallest_y_coord, @robot.smallest_y_coord].min
      @largest_x_coord = [@santa.largest_x_coord, @robot.largest_x_coord].max
      @largest_y_coord = [@santa.largest_y_coord, @robot.largest_y_coord].max
    else
      @smallest_x_coord = @santa.smallest_x_coord
      @smallest_y_coord = @santa.smallest_y_coord
      @largest_x_coord = @santa.largest_x_coord
      @largest_y_coord = @santa.largest_y_coord
    end
  end

  def decide_starting_point
    if !@robot.nil?
      @x_starting_point = @smallest_x_coord > 0 ? 0 : @smallest_x_coord.abs
      @y_starting_point = @smallest_y_coord > 0 ? 0 : @smallest_y_coord.abs
    else
      @x_starting_point = @smallest_x_coord.abs
      @y_starting_point = @smallest_y_coord.abs
    end
  end

  def calculate_range
    @x_range = @largest_x_coord - @smallest_x_coord + 1
    @y_range = @largest_y_coord - @smallest_y_coord + 1
  end

  def draw_map
    calculate_range
    Array.new(@y_range) { Array.new(@x_range, 0) }
  end
end

class File
  attr_accessor :content
  def initialize file_name
    @content = File.read file_name
  end
end

class Elf
  def initialize read_file
    @instructions = read_file 
  end

  def give_instructions map, santa, robot, first_time=false
    @instructions.split("").each_with_index do |direction,index|
      unless robot.nil?
        if index.odd?
          santa.listen_to_radio direction, map, first_time
        else
          robot.listen_to_radio direction, map, first_time
        end
      else
        santa.listen_to_radio direction, map, first_time
      end
    end
  end

  def give_first_present map, y_starting_point, x_starting_point
     map[y_starting_point][x_starting_point] = 2
  end

  def count_presents map
    count = 0
    map.each do |houses|
      count += houses.count { |house| house >= 1 }
    end
    count.to_s + " house".pluralize(count) + " receive at least one present"
  end
end
