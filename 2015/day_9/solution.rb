require 'byebug'

## Using brute-force and permutations
class File
  INSTRUCTION_REGEXP = /(\w+) to (\w+) = (\d+)/
  attr_reader :instructions

  def initialize(file_name)
    @instructions = []
    @contents = File.read(file_name).split("\n")
  end

  def generate_instructions
    @contents.each do |line|
      info = line.scan(INSTRUCTION_REGEXP)[0]
      @instructions << info
    end
  end
end

class Graph
  attr_reader :nodes, :graph

  def initialize
    @graph = {}
  end

  def connect_nodes(from, to, cost)
    if graph.key?(from)
      @graph[from][to] = cost
    else
      @graph[from] = { to => cost }
    end
  end

  def add_edge(from, to, cost)
    # for undirected graph
    connect_nodes(from, to, cost)
    connect_nodes(to, from, cost)
  end

  def get_shortest_path
    @graph.keys.permutation(@graph.keys.size).map do |possible_comb|
      possible_comb.each_cons(2).reduce(0) { |acc, (from, to)| acc + @graph[from][to].to_i }
    end.max
  end
end

file = File.new('input.txt')
file.generate_instructions

graph = Graph.new

file.instructions.each do |from, to, cost|
  graph.add_edge(from, to, cost)
end

puts graph.get_shortest_path
