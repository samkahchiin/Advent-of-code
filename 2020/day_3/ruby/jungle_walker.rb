require 'byebug'

class JungleWalker
	attr_reader :accumulated_tree_count

	def initialize(params)
		@x = params[:initial_x] || 0
		@y = params[:initial_y] || 0
		@data = params[:data]
		@accumulated_tree_count = []
	end

	def count_tree(params)
		@x_steps = params[:x_steps]
		@y_steps = params[:y_steps]
		@row = @data.split("\n").map(&:chars)
		@x_length = @row[0].length
		@y_length = @row.length

		@tree_count = 0

		while @y < @y_length
			move_in_jungle
		end

		@accumulated_tree_count << @tree_count
		@tree_count
	end

	def reset
		@x = 0
		@y = 0
	end

		private

	def move_in_jungle
			@x -= @x_length if @x > @x_length - 1
			@tree_count += 1 if @row[@y][@x] == '#'

			@x += @x_steps
			@y += @y_steps
	end
end

data = File.read('./input.txt')
config = {
		data: data
}
jungle_walker = JungleWalker.new(config)
jungle_walker.count_tree({ x_steps: 1, y_steps: 1 })
jungle_walker.reset
jungle_walker.count_tree({ x_steps: 3, y_steps: 1 })
jungle_walker.reset
jungle_walker.count_tree({ x_steps: 5, y_steps: 1 })
jungle_walker.reset
jungle_walker.count_tree({ x_steps: 7, y_steps: 1 })
jungle_walker.reset
jungle_walker.count_tree({ x_steps: 1, y_steps: 2 })

puts jungle_walker.accumulated_tree_count.reduce(:*)
