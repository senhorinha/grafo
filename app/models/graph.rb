class Graph

    attr_accessor :vertices

    def initialize
        @vertices = Hash.new
    end

    def has_vertex?(vertex_key)
        @vertices.member? vertex_key
    end

    def connected?(vertex_key, other_vertex_key)
        has_vertex?(vertex_key) && has_vertex?(other_vertex_key) && @vertices[vertex_key].connected?(@vertices[other_vertex_key])
    end

    def create_vertex(vertex_key)
        unless has_vertex? vertex_key
            @vertices[vertex_key] = Vertex.new vertex_key
        end
    end

    def connect(vertex_key, other_vertex_key)
        if has_vertex?(vertex_key) && has_vertex?(other_vertex_key)
            @vertices[vertex_key].connect @vertices[other_vertex_key]
            @vertices[other_vertex_key].connect @vertices[vertex_key]
        end
    end

    def disconnect(vertex_key, other_vertex_key)
        if connected?(vertex_key, other_vertex_key)
            @vertices[vertex_key].disconnect @vertices[other_vertex_key]
            @vertices[other_vertex_key].disconnect @vertices[vertex_key]
        end
    end

    def regular?
    	first_vertex_degree = @vertices.values.first.degree
    	regular = true
    	@vertices.each_value do |vertex|
    		regular = false if first_vertex_degree != vertex.degree
    	end
    	regular
 	end
 		
    def adjacents(vertex_key)
        @vertices[vertex_key].adjacents
    end
end