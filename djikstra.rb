require_relative '../graph/graph.rb'
class Djikstra
  def initialize(graph)
    @graph = graph
  end

  def source(vertex)
    set_data_structures
    @min_pq.insert(WeightedVertex.new(vertex,0))
    @distance_map[vertex] = 0
    set_paths
  end

  private

  def set_data_structures
    @previous_map = {}
    @distance_map = {}
    @min_pq = PriorityQueue.min
  end

  def set_paths
    while !@min_pq.empty?
      weighted_vertex = @min_pq.delete_min
      # check all adjacent neighbors and see if new distance is shorter
      weighted_vertex.neighbors.each do |neighbor|
        neighbor_d = neighbor.distance
        neighbor_v = neighbor.vertex
        current_distance = @distance_map[weighted_vertex.vertex]
        new_distance = @distance_map[neighbor_v].to_i + neighbor_d
        if current_distance > new_distance
          @distance_map[weighted_vertex.vertex] = new_distance
          @min_pq.insert(WeightedVertex.new(weighted_vertex.vertex,new_distance))
        end
      end
    end
  end

  def visited?(vertex)
    @visited_array.include?(vertex)
  end
end

class WeightedVertex
  include Comparable

  attr_reader :vertex, :weight

  def initialize(vertex, weight)
    @vertex = vertex
    @weight = weight
  end

  def <=>(object)
    self.weight <=> object.weight
  end
end
