require 'byebug'

class File
  attr_accessor :contents

  def initialize file_name
    @contents = File.read(file_name).split("\n")
  end
end

class RoadPlanner
  def initialize data_arr
    @directory = {}
    place_arr = []
    data_arr.each do |data|
      data = data.split(' ')
      unless @directory[data[0]]
        inner_hash = {}
        inner_hash[data[2]] = data[4]
        @directory[data[0]] = inner_hash
      else
        @directory[data[0]][data[2]] = data[4]
      end
      place_arr << data[2] << data[0]
    end
    @places = place_arr.uniq
  end

  def find_shortest_route
    @places.each_with_index do |place|

    end
  end
end
