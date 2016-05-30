contents = File.read('input.txt')
x_coord = 0
y_coord = 0
largest_x_coord = 0
smallest_x_coord = 0
largest_y_coord = 0
smallest_y_coord = 0
contents.split("").each do |command|
  case command
  when '>'
    x_coord += 1
  when '<'
    x_coord -= 1
  when '^'
    y_coord += 1
  when 'v'
    y_coord -= 1
  end
  largest_x_coord = x_coord if x_coord > largest_x_coord
  largest_y_coord = y_coord if y_coord > largest_y_coord
  smallest_x_coord = x_coord if x_coord < smallest_x_coord
  smallest_y_coord = y_coord if y_coord < smallest_y_coord
end
# print [x_coord, y_coord]
# [-61,33]
#print 'x range:'
#print [smallest_x_coord, largest_x_coord]
#print 'y range:'
#print [smallest_y_coord, largest_y_coord]
# x : [-79,38], y: [-48,43]
#starting_point = [smallest_x_coord.abs][smallest_y_coord.abs]
x_coord = smallest_x_coord.abs
y_coord = smallest_y_coord.abs

x_range = largest_x_coord - smallest_x_coord + 1
y_range = largest_y_coord - smallest_y_coord + 1

map = Array.new(y_range) { Array.new(x_range, 0) }

# Giving present to the first
map[y_coord][x_coord] = 1
contents.split("").each do |command|
  case command
  when '>'
    x_coord += 1
  when '<'
    x_coord -= 1
  when '^'
    y_coord += 1
  when 'v'
    y_coord -= 1
  end
  map[y_coord][x_coord] += 1
end
count = 0
map.each do |array|
  count += array.count { |house| house >= 1 }
end
puts count
