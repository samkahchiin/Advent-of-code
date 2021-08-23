class Reader
	def self.repeat_say(string, repeat_count)
		repeat_count.times { string = say(string) }
		string
	end

	def self.say(string)
		string.chars.chunk(&:itself).map { |elem, arr| "#{arr.size}#{elem}" }.join
	end
end

words = Reader.repeat_say('1', 5)
puts words

words = Reader.repeat_say('1321131112', 40)
puts words

words = Reader.repeat_say('1321131112', 50)
puts words
