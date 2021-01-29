data = File.read('input.txt')

map = {[0, 0] => 1}
coord = [0, 0]

data.each_char do |direction|
    case direction
    when ">"
        coord[0] += 1
    when "<"
        coord[0] -= 1
    when "^"
        coord[1] += 1
    when "v"
        coord[1] -= 1
    end

    map[coord.clone] = map[coord].to_i + 1
end

puts map.values.filter { |number| number >= 1 }.count

# =========================================================

map = {[0, 0] => 1}
santa_coord = [0, 0]
robot_coord = [0, 0]

data.each_char.with_index do |direction, idx|
    coord = idx.even? ? santa_coord : robot_coord

    case direction
    when ">"
        coord[0] += 1
    when "<"
        coord[0] -= 1
    when "^"
        coord[1] += 1
    when "v"
        coord[1] -= 1
    end

    map[coord.clone] = map[coord].to_i + 1
end


puts map.values.filter { |number| number >= 1 }.count
