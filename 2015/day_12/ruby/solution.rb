require 'json'
require 'byebug'

class File
	def self.read_file(path)
		absolute_path = File.expand_path(path, File.dirname(__FILE__))
		File.read(absolute_path)
	end
end

class Abacus
	def self.sum(json)
		extract_number(json).sum
	end

	def self.extract_number(json)
		json.scan(/(-?\d+)/).flatten.map(&:to_i)
	end
end

class SmarterAbacus
	def self.count(elem)
		if elem.instance_of? Integer
			elem
		elsif elem.instance_of? Array
			elem.map { |s| count(s) }.sum
		elsif elem.instance_of? Hash
			elem.values.include?('red') ? 0 : count(elem.values)
		else
			0
		end
	end

	def self.process(arr)
		sum = 0
		arr.each do |elem|
			sum += count(elem)
		end
		sum
	end
end


json = File.read_file('../input.txt')

res = SmarterAbacus.process(JSON.parse(json))

puts res

