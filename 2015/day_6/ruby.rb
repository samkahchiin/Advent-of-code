data = File.read('input.txt')

map = {}

TURN_ON = 'turn on'
TURN_OFF = 'turn off'
TOGGLE = 'toggle'

# PART 1
data.each_line do |line|
    instruction = line.match(/turn on|toggle|turn off/)[0]
    coords =  line.scan(/[0-9]{,4},[0-9]{,4}/)
    start_coord = coords[0].split(',')
    final_coord = coords[1].split(',')

    start_x = start_coord[0].to_i
    start_y = start_coord[1].to_i
    final_x = final_coord[0].to_i
    final_y = final_coord[1].to_i

    (start_x...final_x + 1).each do |x|
        (start_y...final_y + 1).each do |y|
            case instruction
            when TURN_ON
                map[[x, y]] = true
            when TURN_OFF
                map[[x, y]] = false
            when TOGGLE
                map[[x, y]] = !map[[x, y]]
            end
        end
    end
end
puts "PART 1: #{map.values.filter { |n| n }.count}"

# PART 2
data.each_line do |line|
    instruction = line.match(/turn on|toggle|turn off/)[0]
    coords =  line.scan(/[0-9]{,4},[0-9]{,4}/)
    start_coord = coords[0].split(',')
    final_coord = coords[1].split(',')

    start_x = start_coord[0].to_i
    start_y = start_coord[1].to_i
    final_x = final_coord[0].to_i
    final_y = final_coord[1].to_i

    (start_x...final_x + 1).each do |x|
        (start_y...final_y + 1).each do |y|
            map[[x, y]] ||= 0

            case instruction
            when TURN_ON
                map[[x, y]] += 1
            when TURN_OFF
                map[[x, y]] -= 1
                map[[x, y]] = map[[x, y]].negative? ? 0 : map[[x, y]]
            when TOGGLE
                map[[x, y]] += 2
            end
        end
    end
end

puts "PART 2: #{map.values.sum}"


