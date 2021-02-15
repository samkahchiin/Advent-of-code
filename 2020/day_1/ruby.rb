data = File.read('input.txt')
expenses = data.split(' ').map(&:to_i).sort!
search_arr = expenses.reverse

MAGIC_NUMBER = 2020

expenses.each do |num|
    another_num = search_arr.find { |n| n == (MAGIC_NUMBER - num) }
    if another_num
        puts another_num * num
        break 
    end
end

expenses.each_with_index do |num_1, i|
    expenses[i+1..-1].each do |num_2|
        another_num = search_arr.find { |n| n == (MAGIC_NUMBER - num_1 - num_2) }
        if another_num
            puts another_num * num_1 * num_2
            break 
        end
    end
end
