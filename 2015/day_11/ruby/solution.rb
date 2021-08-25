class PasswordValidator
	A_VALUE = "a".ord
	Z_VALUE = "z".ord
	CONFUSING_CHARS = ['i', 'o', 'l']

	def initialize(string)
		@string = string
	end

	def generate_next_string
		int_arr = convert_to_integers(@string)
		current_idx = -1
		while true
			break if int_arr.count < -current_idx
			unless exceed_z?(int_arr[current_idx])
				int_arr[current_idx] += 1
				break
			end

			if is_confusing_char?(int_arr[current_idx])
				int_arr[current_idx] += 2
				break
			end

			int_arr[current_idx] = A_VALUE
			current_idx -= 1
		end
		convert_to_string(int_arr)
	end

	def generate_next_password
		while true
			@string = generate_next_string
			return @string if is_valid?
		end
	end

	def is_valid?
		no_confusing_chars && validate_overlapping_chars && contain_three_increasing_chars
	end

	private

	def validate_overlapping_chars
		@string.chars.each_cons(2).filter { |a, b| a == b }.uniq.count >= 2
	end

	def no_confusing_chars
		!@string.scan(/i|o|l/).count.positive?
	end

	def contain_three_increasing_chars
		begin
			int_arr = convert_to_integers(@string)
			!int_arr.each_cons(3).find { |a, b, c| a + 1 == b && b + 1 == c }.nil?
		rescue => e
			puts @string
		end
	end

	def exceed_z?(char_val)
		char_val >= Z_VALUE
	end

	def is_confusing_char?(char_val)
		CONFUSING_CHARS.map(&:ord).include? char_val
	end

	def convert_to_integers(string)
		string.chars.map(&:ord)
	end

	def convert_to_string(int_arr)
		int_arr.map(&:chr).join
	end

end

res = PasswordValidator.new("hxbxwxba").generate_next_password
puts res
# puts PasswordValidator.new("ghjaabcc").is_valid?
