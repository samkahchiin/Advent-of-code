data = File.read('input.txt')
valid_count = 0
data.each_line do |line|
    policy, letter, password = line.split(" ")
    min, max = policy.split("-")

    valid_count += 1 if min.to_i <= password.count(letter) && password.count(letter) <= max.to_i
end

puts "Part 1: #{valid_count}"

valid_count = 0
data.each_line do |line|
    policy, letter, password = line.tr(":", "").split(" ")
    pos_1, pos_2 = policy.split("-")

    valid_count += 1 if [password[pos_1.to_i - 1] == letter, password[pos_2.to_i - 1] == letter].one?
end

puts "Part 2: #{valid_count}"
