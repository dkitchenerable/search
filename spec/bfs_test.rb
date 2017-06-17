require_relative '../graph/graph.rb'
require_relative '../searcher.rb'

describe Bfs do
  before(:each) do
    # create vertices
    v1 = Vertex.new("A",1)
    v2 = Vertex.new("B",2)
    @v3 = Vertex.new("C",3)
    @v4 = Vertex.new("D",4)
    e1 = [v1,v2,0]
    e2 = [v2,@v3,0]
    e3 = [@v3,@v4,0]
    @graph = Graph.new([v1,v2,@v3,@v4], [e1,e2,e3])
  end

  context "empty graph" do
    it "should return nil" do
      graph = Graph.new([],[])
      bfs = Searcher.new("Bfs", graph)
      result = bfs.search("FOOBAR")
      expect(result).to eq(nil)
    end
  end

  context "key somewhere in graph" do
    it "should return vertex" do
      bfs = Bfs.new(@graph)
      result = bfs.search(@v4.key)
      expect(result).to eq(@v4)
    end

    it "should return vertex" do
      bfs = Bfs.new(@graph)
      result = bfs.search(@v3.key)
      expect(result).to eq(@v3)
    end    
  end

  context "key not in graph" do
    it "should return nil" do
      bfs = Bfs.new(@graph)
      result = bfs.search("FOOBAR")
      expect(result).to eq(nil)
    end
  end
end
