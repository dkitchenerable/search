require_relative '../data_structures/linked_list.rb'

class Graph
  def initialize(vertices, edges)
    @adj_list = {}
    vertices.each do |vertex|
      add_vertex(vertex)
    end
    edges.each do |edge|
      add_edge(edge[0], edge[1], edge[2])
    end
  end

  def add_vertex(v)
    @adj_list[v] = LinkedList.new
  end

  def add_edge(v1, v2, distance=nil)
    node1 = NeighborNode.new(v1, distance)
    node2 = NeighborNode.new(v2, distance)
    @adj_list[v1].push_front(node2)
    @adj_list[v2].push_front(node1)
  end

  def neighbors(vertex)
    @adj_list[vertex]
  end

  def vertices
    @adj_list.keys
  end

  def any_vertex
    @adj_list.keys.sample
  end
end

class Vertex
  attr_accessor :key, :value
  def initialize(k, v)
    @key = k
    @value = v
  end
end

class NeighborNode < Node
  attr_accessor :vertex, :distance
  def initialize(vertex, distance)
    @vertex = vertex
    @distance = distance
    super
  end
end
