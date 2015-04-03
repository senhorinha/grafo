require './app/models/graph.rb'

class GraphTest < Test::Unit::TestCase
    context "a graph" do
        setup do
            @graph = Graph.new
        end

        should "add a new vertex" do
            v = Vertex.new
            @graph.addVertex(v);
            assert_contains @graph.vertices, v
            assert_equal 1, @graph.vertices.length
        end
    end
end