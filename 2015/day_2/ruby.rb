areas = File.read('input.txt').each_line.map do |line| 
    a, b, c = line.split('x').map(&:to_i).sort!
    3 * a * b + 2 * a * c + 2 * b * c
end.sum

puts areas
