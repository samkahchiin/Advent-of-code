require 'rspec'
require_relative 'jungle_walker'

describe 'Jungle Walker' do
	it 'return the numbers of trees encountered' do
		data = File.read('./test_input.txt')
		config = {
				data: data
		}
		jungle_walker = JungleWalker.new(config)
		expect(jungle_walker.count_tree({ x_steps: 3, y_steps: 1 })).to eq 7
	end

	describe "sudden arboreal stop" do
		it 'return the numbers of trees encountered' do
			data = File.read('./test_input.txt')
			config = {
					data: data
			}
			jungle_walker = JungleWalker.new(config)
			expect(jungle_walker.count_tree({ x_steps: 1, y_steps: 1 })).to eq 2
			jungle_walker.reset
			expect(jungle_walker.count_tree({ x_steps: 3, y_steps: 1 })).to eq 7
			jungle_walker.reset
			expect(jungle_walker.count_tree({ x_steps: 5, y_steps: 1 })).to eq 3
			jungle_walker.reset
			expect(jungle_walker.count_tree({ x_steps: 7, y_steps: 1 })).to eq 4
			jungle_walker.reset
			expect(jungle_walker.count_tree({ x_steps: 1, y_steps: 2 })).to eq 2
			expect(jungle_walker.accumulated_tree_count.reduce(:*)).to eq 336
		end
	end
end
