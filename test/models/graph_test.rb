require 'test_helper'

class GraphTest < ActiveSupport::TestCase
    def setup
        @graph = Graph.new
    end

    test "should add a new vertex" do
        v = Vertex.new
        @graph.addVertex(v);
        assert_equal 1, @graph.vertices.length
    end
end