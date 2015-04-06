require 'test_helper'

class GraphTest < ActiveSupport::TestCase

    def setup
        @graph = Graph.new
        @vertex_one = Vertex.new
        @vertex_two = Vertex.new
        @vertex_three = Vertex.new
    end

    def add_vertex
        @graph.add_vertex @vertex_one
        @graph.add_vertex @vertex_two
        @graph.add_vertex @vertex_three
    end

    test "should add a new vertex" do
        @graph.add_vertex(@vertex_one)
        assert_equal true, @graph.has_vertex?(@vertex_one)
    end

    test "should add two new vertices" do
        add_vertex
        assert_equal true, @graph.has_vertex?(@vertex_one) && @graph.has_vertex?(@vertex_two)
    end

    test "should connect vertices" do
        add_vertex
        @graph.connect @vertex_one, @vertex_two
        assert_equal true, @graph.connected?(@vertex_one, @vertex_two)
    end

    test "should not be connected" do
        add_vertex
        assert_equal false, @graph.connected?(@vertex_two, @vertex_one)
    end

    test "should disconnect a vertex" do
        add_vertex
        @graph.connect @vertex_one, @vertex_two
        @graph.disconnect @vertex_one, @vertex_two
        assert_equal false, @graph.connected?(@vertex_one, @vertex_two)
    end

    test "should return the adjacents of a vertex" do
        add_vertex
        @graph.connect @vertex_one, @vertex_two
        @graph.connect @vertex_one, @vertex_three
        @graph.connect @vertex_three, @vertex_one
        adjacents = @graph.adjacents @vertex_one
        assert_equal true, adjacents.member?(@vertex_two) && adjacents.member?(@vertex_three)
    end

end