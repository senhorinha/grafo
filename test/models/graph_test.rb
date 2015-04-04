require 'test_helper'

class GraphTest < ActiveSupport::TestCase

    def setup
        @graph = Graph.new
        @vertex_one = Vertex.new
        @vertex_two = Vertex.new
    end

    def add_vertices
        @graph.add_vertex @vertex_one
        @graph.add_vertex @vertex_two
    end

    test "should add a new vertex" do
        @graph.add_vertex(@vertex_one)
        assert_equal true, @graph.has_vertex?(@vertex_one)
    end

    test "should add two new vertices" do
        add_vertices
        assert_equal true, @graph.has_vertex?(@vertex_one) && @graph.has_vertex?(@vertex_two)
    end

    test "should connect vertices" do
        add_vertices
        @graph.connect @vertex_one, @vertex_two
        assert_equal true, @graph.connected?(@vertex_one, @vertex_two)
    end

    test "should not be connected" do
        add_vertices
        @graph.connect @vertex_one, @vertex_two
        assert_equal false, @graph.connected?(@vertex_two, @vertex_one)
    end

end