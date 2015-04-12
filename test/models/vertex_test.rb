require 'test_helper'

class VertexTest < ActiveSupport::TestCase

	def setup
        @vertex_one = Vertex.new 1
        @vertex_two = Vertex.new 2
    end

    test "degree should never be nil" do
    	assert_not_nil @vertex_one.degree
    end

end