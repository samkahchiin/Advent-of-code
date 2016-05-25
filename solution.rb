
contents = File.read('input.txt')
count = 0
contents.split("").each do |x|
  case x
  when '('
    count += 1
  when ')'
    count -= 1
  end
end

puts count
