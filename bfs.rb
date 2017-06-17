require_relative 'data_structures/queue.rb'

class Bfs
  def initialize(graph)
    @graph = graph
    @queue = Queue.new
    @visited_array = Array.new(graph.vertices.size)
  end

  def search(key)
    # pick a random vertex
    vertex = @graph.any_vertex
    return nil unless vertex
    return vertex if vertex.key == key
    # add to queue
    @queue.enqueue(vertex)
    # mark as visited
    mark_visited(vertex)

    while !@queue.empty?
      vertex = @queue.dequeue
      # neighbors is a list of nodes where key is vertex, and value is distance
      neighbors = @graph.neighbors(vertex)
      neighbor_node = neighbors.head
      return neighbor_node.vertex if neighbor_node.vertex.key == key
      while neighbor_node
        if !visited?(neighbor_node.vertex)
          mark_visited(neighbor_node.vertex)
          @queue.enqueue(neighbor_node.vertex)
        end
        neighbor_node = neighbor_node.next
      end
    end
    return nil
  end

  private

  def visited?(vertex)
    @visited_array.include?(vertex)
  end

  def mark_visited(vertex)
    @visited_array << vertex
  end

  def visited_vertexes
    return @visited_array
  end
end
