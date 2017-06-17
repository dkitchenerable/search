class Dfs
  def initialize(graph)
    @graph = graph
    @queue = Queue.new
    @visited_array = Array.new(graph.vertices.size)
  end

  def search(key)
    match = nil
    @graph.vertices.each do |vertex|
      match = dfs_search(vertex, key)
      break if match
    end
    return match
  end

  private

  def dfs_search(vertex, key)
    # mark as visited
    mark_visited(vertex)
    # check if matches key
    return vertex if vertex.key == key
    # check all unvisited neighbors and if not visited
    # send to recursive search
    neighbors = @graph.neighbors(vertex)
    node = neighbors.head
    while node
      dfs_search(node.vertex, key) if !visited?(node.vertex)
      node = node.next
    end
    return nil
  end

  def visited?(vertex)
    @visited_array.include?(vertex)
  end

  def mark_visited(vertex)
    @visited_array << vertex
  end

end
