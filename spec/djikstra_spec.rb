require_relative '../../graph/graph.rb'

describe Djikstra do
  before(:each) do
    # create vertices
    v1 = Vertex.new("A",1)
    v2 = Vertex.new("B",2)
    @v3 = Vertex.new("C",3)
    @v4 = Vertex.new("D",4)
    e1 = [v1,v2,1]
    e2 = [v2,@v3,3]
    e3 = [@v3,@v4,4]
    @graph = Graph.new([v1,v2,@v3,@v4], [e1,e2,e3])
  end
  
  describe "#initialize" do
    context "empty graph" do
      it "all paths are nil" do
      end
    end
  end
end
