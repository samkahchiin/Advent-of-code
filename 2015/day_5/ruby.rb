data = File.read('input.txt')
vowel = ['a', 'e', 'i', 'o', 'u']
illegal_str = ['ab', 'cd', 'pq', 'xy']

nice_string = []

data.each_line do |str|
    if /(\w*[aeuio]\w*){3,}/.match(str) && 
    /([a-zA-Z]{2,}).*?\1/.match(str) 
        nice_string << str
    end
   # condition_1 = string.split('').filter { |char| vowel.include?(char)}.count >= 3
    # condition_2 = 
    # condition_3 = !['ab', 'cd', 'pq', 'xy'].any? { |short_str| string.include? short_str }
    # nice_string << condition_1
    break
end

puts nice_string.count
