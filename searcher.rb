require_relative 'bfs.rb'
require_relative 'dfs.rb'

class Searcher
  def initialize(strategy, graph)
    if strategy == "Bfs"
      @strategy = Bfs.new(graph)
    elsif strategy == "Dfs"
      @strategy = Dfs.new(graph)
    else
      raise "NO SUCH SEARCH STRATEGY!"
    end
  end

  def search(key)
    @strategy.search(key)
  end
end
