class Graph

    attr_accessor :vertices

    def initialize
        @vertices = Hash.new
    end

    def has_vertex?(vertex)
        @vertices.member? vertex
    end

    def connected?(vertex, other_vertex)
        has_vertex?(vertex) && has_vertex?(other_vertex) && vertex.connected?(other_vertex)
    end

    def add_vertex(vertex)
        unless has_vertex? vertex
            @vertices[vertex] = 1 
        end
    end

    def connect(vertex, other_vertex)
        if has_vertex?(vertex) && has_vertex?(other_vertex)
            vertex.connect other_vertex
            other_vertex.connect vertex
        end
    end

    def disconnect(vertex, other_vertex)
        if connected?(vertex, other_vertex)
            vertex.disconnect other_vertex
            other_vertex.disconnect vertex
        end
    end

    def regular?
    	first_vertex_degree = @vertices.keys.first.degree
    	regular = true
    	@vertices.each_value do |vertex|
    		regular = false if first_vertex_degree != vertex.degree
    	end
    	regular
 	end
 		
    def adjacents(vertex)
        vertex.adjacents
    end
end