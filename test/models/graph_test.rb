require 'test_helper'

class GraphTest < ActiveSupport::TestCase

    def setup
        @graph = Graph.new
        @vertex_one = Vertex.new 1
        @vertex_two = Vertex.new 2
        @vertex_three = Vertex.new 3
        @vertex_four = Vertex.new 4
        @vertex_five = Vertex.new 5
    end

    def add_vertices
        @graph.add_vertex @vertex_one
        @graph.add_vertex @vertex_two
        @graph.add_vertex @vertex_three
        @graph.add_vertex @vertex_four
        @graph.add_vertex @vertex_five
    end

    test "should add a new vertex" do
        @graph.add_vertex(@vertex_one)
        assert_equal true, @graph.has_vertex?(@vertex_one)
    end

    test "should remove vertex and all your relationships" do
        add_vertices
        @graph.connect @vertex_two, @vertex_one
        @graph.remove_vertex @vertex_one
        assert_equal false, @graph.has_vertex?(@vertex_one) || @graph.adjacents(@vertex_two).member?(@vertex_one)
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
        assert_equal false, @graph.connected?(@vertex_two, @vertex_one)
    end

    test "should disconnect a vertex" do
        add_vertices
        @graph.connect @vertex_one, @vertex_two
        @graph.disconnect @vertex_one, @vertex_two
        assert_equal false, @graph.connected?(@vertex_one, @vertex_two)
    end

    test "should return the adjacents of a vertex" do
        add_vertices
        @graph.connect @vertex_one, @vertex_two
        @graph.connect @vertex_one, @vertex_three
        @graph.connect @vertex_three, @vertex_one
        adjacents = @graph.adjacents @vertex_one
        assert_equal true, adjacents.member?(@vertex_two) && adjacents.member?(@vertex_three)
    end

    test "should return the transitive closure of a vertex" do
        add_vertices
        @graph.connect @vertex_one, @vertex_two
        @graph.connect @vertex_one, @vertex_three
        @graph.connect @vertex_three, @vertex_four
        @graph.connect @vertex_four, @vertex_five
        transitive_closure = @graph.transitive_closure_of(@vertex_one)
        assert_equal true, transitive_closure.include?(@vertex_one) && transitive_closure.include?(@vertex_two) && transitive_closure.include?(@vertex_three) && transitive_closure.include?(@vertex_four) && transitive_closure.include?(@vertex_five)
    end

end